#!/usr/bin/env python3
"""
Adaptive Control System for Nanonis SPM

This system continuously monitors SPM signals (bias voltage and Z position) and
automatically performs tip preparation when signals go out of acceptable ranges.

Flow:
1. Monitor bias and Z signals in background (DecisionEngine)
2. Evaluate system state: BAD, GOOD, or STABLE based on signal ranges
3. Execute appropriate action:
   - BAD state: Perform tip preparation cycle
   - GOOD state: Continue stable monitoring
   - STABLE state: System is optimal, shut down
4. Log all signal data to file for analysis
"""

import time
import queue
from enum import Enum
from nanonis_client import NanonisConnection, NanonisController, SignalMonitor

# =============================================================================
# CONFIGURATION PARAMETERS
# =============================================================================

# Signal ranges that define "good" system state
BIAS_RANGE = (0, 2.0)           # Acceptable bias voltage range (V)
Z_RANGE = (-500e-9, 400e-9)     # Acceptable Z position range (m)

# Tip preparation parameters
PULSE_WIDTH = 0.1               # Bias pulse duration (s)
PULSE_BIAS = 4                  # Bias pulse voltage (V)
MOVE_STEP = 2e-9                # XY position step size (m)

# =============================================================================
# DATA STRUCTURES
# =============================================================================

class SystemState(Enum):
    """Possible system states based on signal quality"""
    BAD = "bad"        # Signals out of range, needs tip preparation
    GOOD = "good"      # Signals in acceptable range
    STABLE = "stable"  # System consistently good, ready to shut down

class SignalData:
    """Container for signal measurement data and state evaluation"""
    
    def __init__(self, bias_mean, z_mean, timestamp=None):
        self.bias_mean = bias_mean
        self.z_mean = z_mean
        self.timestamp = timestamp or time.time()
        
    def evaluate_state(self):
        """Determine system state based on current signal values"""
        bias_in_range = BIAS_RANGE[0] <= self.bias_mean <= BIAS_RANGE[1]
        z_in_range = Z_RANGE[0] <= self.z_mean <= Z_RANGE[1]
        
        return SystemState.GOOD if (bias_in_range and z_in_range) else SystemState.BAD
    
    def __str__(self):
        return f"Bias={self.bias_mean:.3f}V, Z={self.z_mean:.2e}m"

# =============================================================================
# SIGNAL MONITORING AND DECISION ENGINE
# =============================================================================

class DecisionEngine(SignalMonitor):
    """
    Monitors SPM signals in background and detects state changes.
    
    Features:
    - Continuous signal monitoring via separate TCP connection
    - Automatic logging of signal data to CSV file  
    - State change detection and event notification
    - Thread-safe communication via queue
    """
    
    def __init__(self, signal_indices, event_queue, bias_idx, z_idx, 
                 separate_connection=("127.0.0.1", 6502),
                 window_size=20, sample_rate=5, log_file="signal_log.txt"):
        """
        Initialize decision engine with separate monitoring connection.
        
        Args:
            signal_indices: List of signal indices to monitor
            event_queue: Queue for sending state change notifications
            bias_idx: Index of bias voltage signal
            z_idx: Index of Z position signal
            separate_connection: (host, port) for monitoring connection
            window_size: Number of samples for moving average
            sample_rate: Samples per second
            log_file: CSV file path for logging
        """
        super().__init__(separate_connection, signal_indices, window_size, sample_rate)
        self.event_queue = event_queue
        self.bias_idx = bias_idx
        self.z_idx = z_idx
        self.log_file = log_file
        self.last_state = None
        
    def _reader_loop(self):
        """Override to add event detection and logging."""
        connection = None
        nanonis = self.nanonis
        
        try:
            if self.own_connection:
                import socket
                import nanonis_spm
                connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                connection.connect((self.host, self.port))
                nanonis = nanonis_spm.Nanonis(connection)
                print(f"DecisionEngine: Connected to {self.host}:{self.port}")
            
            with open(self.log_file, 'a') as log:
                log.write(f"# Signal monitoring started at {time.ctime()}\n")
                log.write("# timestamp,bias_mean,z_mean,state\n")
                
                while not self._shutdown.is_set():
                    try:
                        if len(self.signal_indices) == 1:
                            value = nanonis.Signals_ValGet(self.signal_indices[0], True)[2][0]
                            values = [value]
                        else:
                            result = nanonis.Signals_ValsGet(self.signal_indices, True)[2][1]
                            values = [val[0] if isinstance(val, tuple) else val for val in result]
                        
                        # Update data windows and calculate means
                        with self._lock:
                            for i, signal_idx in enumerate(self.signal_indices):
                                self._data_windows[signal_idx].append(values[i])
                                if len(self._data_windows[signal_idx]) > 0:
                                    from statistics import mean
                                    self._current_means[signal_idx] = mean(self._data_windows[signal_idx])
                            
                            # Get current means for decision making
                            bias_mean = self._current_means.get(self.bias_idx, 0.0)
                            z_mean = self._current_means.get(self.z_idx, 0.0)
                        
                        # Evaluate current system state
                        signal_data = SignalData(bias_mean, z_mean)
                        current_state = signal_data.evaluate_state()
                        
                        # Log data when we have sufficient samples
                        if len(self._data_windows[self.bias_idx]) >= 10:
                            log.write(f"{signal_data.timestamp:.3f},{bias_mean:.6f},{z_mean:.2e},{current_state.value}\n")
                            log.flush()
                        
                        # Notify controller of state changes
                        if self.last_state != current_state:
                            try:
                                self.event_queue.put_nowait(signal_data)
                                print(f"DecisionEngine: State changed to {current_state.value}")
                            except queue.Full:
                                print("Warning: Event queue full, dropping state change event")
                            self.last_state = current_state
                        
                        time.sleep(self.sample_interval)
                        
                    except Exception as e:
                        if not self._shutdown.is_set():
                            print(f"Error reading signals: {e}")
                        time.sleep(0.1)
                        
        except Exception as e:
            print(f"DecisionEngine: Failed to connect: {e}")
            
        finally:
            if connection:
                connection.close()
                print(f"DecisionEngine: Disconnected")
    
    def get_current_signal_data(self):
        """Get current signal measurements for decision making."""
        with self._lock:
            bias_mean = self._current_means.get(self.bias_idx, 0.0)
            z_mean = self._current_means.get(self.z_idx, 0.0)
            
        signal_data = SignalData(bias_mean, z_mean)
        try:
            self.event_queue.put_nowait(signal_data)
        except queue.Full:
            print("Warning: Event queue full for decision request")

# =============================================================================
# MAIN ADAPTIVE CONTROL SYSTEM
# =============================================================================

class AdaptiveController:
    """
    Main adaptive control system that coordinates signal monitoring and tip preparation.
    
    System Logic:
    - Start in BAD state (assumes tip needs preparation)
    - Monitor signals continuously via DecisionEngine
    - Execute appropriate actions based on current state:
      * BAD -> perform tip preparation
      * GOOD -> continue monitoring  
      * STABLE -> system optimized, shutdown
    """
    
    def __init__(self, nanonis):
        """
        Initialize adaptive control system.
        
        Args:
            nanonis: Raw nanonis_spm.Nanonis connection object
        """
        self.nanonis = nanonis
        self.controller = NanonisController(nanonis)
        self.event_queue = queue.Queue(maxsize=50)
        self.current_state = SystemState.BAD  # Start assuming bad state
        
        # Signal indices for monitoring (from debug output)
        self.bias_idx = 24  # Bias voltage signal
        self.z_idx = 30     # Z position signal
        
        # Initialize decision engine with separate monitoring connection
        self.decision_engine = DecisionEngine(
            [self.bias_idx, self.z_idx], 
            self.event_queue, 
            self.bias_idx, 
            self.z_idx
        )
    
    def get_current_system_state(self, timeout=1.0):
        """
        Request current signal data and return system state evaluation.
        
        Args:
            timeout: Maximum time to wait for response (seconds)
            
        Returns:
            SignalData object with current measurements, or None if timeout
        """
        # Request fresh data from monitoring thread
        self.decision_engine.get_current_signal_data()
        
        # Wait for response
        try:
            signal_data = self.event_queue.get(timeout=timeout)
            return signal_data
        except queue.Empty:
            print("Warning: No response from decision engine")
            return None
    
    def execute_tip_preparation(self):
        """
        Execute one cycle of tip preparation procedure.
        
        Steps:
        1. Get current XY position
        2. Auto-approach to surface
        3. Apply bias pulse to condition tip
        4. Withdraw tip from surface
        5. Move to new XY position
        6. Re-approach for next measurement
        """
        print("Executing tip preparation...")
        
        try:
            # Get current position and move slightly for fresh surface area
            x, y = self.nanonis.FolMe_XYPosGet(1)[2]
            print("  Starting tip preparation cycle")
            
            # Approach surface
            self.controller.auto_approach_and_wait(False)
            
            # Apply conditioning pulse to tip
            self.nanonis.Bias_Pulse(1, PULSE_WIDTH, PULSE_BIAS, 0, 0)
            
            # Withdraw tip safely
            self.nanonis.ZCtrl_Withdraw(1, 0.5)

            self.move_using_folme()
            
            # Re-approach for stable measurement
            self.controller.auto_approach_and_wait(False)
            
            print("  Tip preparation completed")
            
        except Exception as e:
            print(f"  Tip preparation failed: {e}")
    
    def move_using_folme(self):
        """Move to fresh surface area using Follow Me positioning"""
        try:
            x, y = self.nanonis.FolMe_XYPosGet(1)[2]
            x += MOVE_STEP
            y += MOVE_STEP
            self.nanonis.FolMe_XYPosSet(x, y, True)
        except Exception as e:
            print(f"  Follow Me positioning failed: {e}")

    def move_using_motor(self):
        """Move to fresh surface area using motor positioning"""
        try:
            # Alternative movement method if Follow Me isn't available
            print("  Motor positioning not implemented - using Follow Me fallback")
            self.move_using_folme()
        except Exception as e:
            print(f"  Motor positioning failed: {e}")

    def execute_stable_monitoring(self):
        """
        Execute stable monitoring when system is in good state.
        
        Just waits and lets the DecisionEngine continue monitoring
        in the background to detect any degradation.
        """
        print("System stable - monitoring...")
        print("  Continuing background signal monitoring")
        time.sleep(2.0)  # Allow time for signal monitoring
        print("  Monitoring cycle completed")
    
    def run(self):
        """
        Optimized event-driven adaptive control loop.
        
        Improvements:
        - Event-driven state changes (no unnecessary polling)
        - Efficient queue processing with latest-event priority
        - Dynamic timing based on state and activity
        - Reduced redundant evaluations
        """
        print("\n" + "="*60)
        print("ADAPTIVE CONTROL SYSTEM STARTING")
        print("="*60)
        print(f"Signal ranges: Bias {BIAS_RANGE[0]}-{BIAS_RANGE[1]}V, Z {Z_RANGE[0]:.2e}-{Z_RANGE[1]:.2e}m")
        print(f"Monitoring on port 6502, Control on port 6501")
        
        # Start background signal monitoring
        self.decision_engine.start()
        print("Background signal monitoring started")
        
        try:
            cycle_count = 0
            last_action_time = time.time()
            
            while True:
                cycle_count += 1
                print(f"\n--- Cycle {cycle_count}: {self.current_state.value.upper()} STATE ---")
                
                # Execute action based on current state
                action_taken = False
                if self.current_state == SystemState.BAD:
                    self.execute_tip_preparation()
                    action_taken = True
                    last_action_time = time.time()
                elif self.current_state == SystemState.GOOD:
                    self.execute_stable_monitoring()
                elif self.current_state == SystemState.STABLE:
                    print("\nSystem optimized and stable - shutting down")
                    break
                
                # Process state changes from background monitoring
                state_changed = self._process_background_events()
                
                # Only request fresh data if we took action or haven't checked recently
                time_since_action = time.time() - last_action_time
                if action_taken or time_since_action > 5.0:  # Check every 5s when stable
                    print("\nRequesting fresh state evaluation...")
                    signal_data = self.get_current_system_state(timeout=0.5)
                    if signal_data:
                        self._update_state_from_data(signal_data)
                        last_action_time = time.time()
                
                # Dynamic sleep timing based on state and activity
                if self.current_state == SystemState.BAD:
                    time.sleep(0.5)  # Fast cycles when fixing problems
                elif state_changed:
                    time.sleep(0.2)  # Quick response to changes
                else:
                    time.sleep(2.0)  # Slower when stable
                
        except KeyboardInterrupt:
            print("\nShutting down due to user interrupt...")
        except Exception as e:
            print(f"\nSystem error: {e}")
        finally:
            print("\nStopping background monitoring...")
            self.decision_engine.stop()
            print("Adaptive control system stopped")
            print("="*60)
    
    def _process_background_events(self):
        """
        Process background state change events efficiently.
        
        Returns:
            bool: True if any state changes were processed
        """
        events_processed = 0
        latest_signal_data = None
        
        # Process all pending events, keeping only the latest
        while not self.event_queue.empty():
            try:
                signal_data = self.event_queue.get_nowait()
                latest_signal_data = signal_data  # Keep only the most recent
                events_processed += 1
            except queue.Empty:
                break
        
        # Apply state change from most recent event
        if latest_signal_data:
            new_state = latest_signal_data.evaluate_state()
            old_state = self.current_state
            
            if new_state != old_state:
                print(f"Background state change: {latest_signal_data} -> {new_state.value}")
                self._update_state_from_evaluation(old_state, new_state)
                
            if events_processed > 1:
                print(f"   (Processed {events_processed} events, used latest)")
            
            return new_state != old_state
        
        return False
    
    def _update_state_from_data(self, signal_data):
        """Update system state from signal data."""
        new_state = signal_data.evaluate_state()
        print(f"Current: {signal_data} -> {new_state.value}")
        
        old_state = self.current_state
        self._update_state_from_evaluation(old_state, new_state)
    
    def _update_state_from_evaluation(self, old_state, new_state):
        """Apply state transition rules."""
        if old_state == SystemState.BAD and new_state == SystemState.GOOD:
            self.current_state = SystemState.GOOD
            print("Tip preparation successful: BAD -> GOOD")
        elif old_state == SystemState.GOOD and new_state == SystemState.GOOD:
            self.current_state = SystemState.STABLE  # Two good evaluations = stable
            print("System stabilized: GOOD -> STABLE")
        elif new_state == SystemState.BAD:
            self.current_state = SystemState.BAD
            if old_state != SystemState.BAD:
                print("System degraded: needs tip preparation")

# =============================================================================
# MAIN ENTRY POINT
# =============================================================================

def main():
    """
    Main entry point for adaptive control system.
    
    Creates connection to Nanonis on port 6501 and starts adaptive control.
    """
    print("Connecting to Nanonis SPM on port 6501...")
    
    with NanonisConnection() as nanonis:
        controller = AdaptiveController(nanonis)
        controller.run()

if __name__ == "__main__":
    main()
