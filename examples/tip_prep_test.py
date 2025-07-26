import numpy as np
import logging
from enum import Enum
from nanonis_client import NanonisConnection

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class TipState(Enum):
    BAD = "bad"           # Run preparation loop
    GOOD = "good"         # Run validation loop
    STABLE = "stable"     # Tip is stable, program complete

class TipPrepStateMachine:
    def __init__(self, nanonis_connection):
        self.nanonis = nanonis_connection
        self.tip_state = TipState.BAD
        
        # Configuration
        self.pulse_width = 0.1
        self.pulse_bias = 4
        self.dx = 2e-9
        self.dy = 2e-9
        
        # Thresholds
        self.good_tip_threshold = 1.5
        self.stability_threshold = 0.1
        
        # Counters
        self.stability_counter = 0
        self.required_stable_cycles = 5
        self.max_prep_iterations = 10
        self.prep_iteration = 0
        
        # Signal history for stability analysis
        self.recent_signals = []
        self.max_signal_history = 5
        
    def get_tip_quality_value(self):
        """Get signal value that determines tip state"""
        signals = self.nanonis.Signals_ValGet(1, True)
        signal_value = signals[0] if signals else 0
        
        self.recent_signals.append(signal_value)
        if len(self.recent_signals) > self.max_signal_history:
            self.recent_signals.pop(0)
            
        return signal_value
    
    def evaluate_tip_state(self, signal_value):
        """Determine tip state based on signal value and history"""
        if signal_value < self.good_tip_threshold:
            return TipState.BAD
        
        if len(self.recent_signals) >= self.max_signal_history:
            signal_variation = np.std(self.recent_signals)
            if signal_variation < self.stability_threshold:
                if self.stability_counter >= self.required_stable_cycles:
                    return TipState.STABLE
        
        return TipState.GOOD
    
    def run_cycle(self):
        """Run one cycle based on current tip state"""
        if self.tip_state == TipState.BAD:
            self.preparation_cycle()
        elif self.tip_state == TipState.GOOD:
            self.validation_cycle()
    
    def preparation_cycle(self):
        """Preparation loop for bad tips"""
        logger.info(f"Preparation cycle {self.prep_iteration + 1}")
        
        self.nanonis.auto_approach_and_wait(True) 
        self.nanonis.Bias_Pulse(1, self.pulse_width, 2, 0, 0)
        self.nanonis.ZCtrl_Withdraw(1, 0.5)
        
        x, y = self.nanonis.FolMe_XYPosGet(1)[2]
        self.nanonis.FolMe_XYPosSet(x + self.dx, y + self.dy, True)
        
        self.nanonis.auto_approach_and_wait(True)
        self.prep_iteration += 1
        
    def validation_cycle(self):
        """Validation loop for good tips"""
        logger.info(f"Validation cycle {self.stability_counter + 1}")
        
        # Different behavior for testing good tips
        self.nanonis.auto_approach_and_wait(True)
        # Add your validation-specific operations here
        
        self.stability_counter += 1
    
    def should_continue(self):
        """Check if we should continue running"""
        return (self.tip_state != TipState.STABLE and 
                self.prep_iteration < self.max_prep_iterations)
    
    def run(self):
        """Main state machine loop"""
        logger.info("Starting tip preparation state machine")
        
        while self.should_continue():
            self.run_cycle()
            
            signal_value = self.get_tip_quality_value()
            old_state = self.tip_state
            self.tip_state = self.evaluate_tip_state(signal_value)
            
            if old_state != self.tip_state:
                logger.info(f"Tip state: {old_state.value} -> {self.tip_state.value}")
                if self.tip_state == TipState.BAD:
                    self.stability_counter = 0  # Reset if tip degraded
            
            logger.info(f"Signal: {signal_value:.3f}, State: {self.tip_state.value}")
        
        if self.tip_state == TipState.STABLE:
            logger.info("Tip is stable! Program completed successfully.")
        else:
            logger.warning("Maximum iterations reached.")

if __name__ == "__main__":
    with NanonisConnection() as nanonis:
        nanonis.returnDebugInfo(1)
        
        state_machine = TipPrepStateMachine(nanonis)
        state_machine.run()