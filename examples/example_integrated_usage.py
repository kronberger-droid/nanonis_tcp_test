#!/usr/bin/env python3
"""
Example using separate connections for signal monitoring vs control operations.
Uses bias voltage and Z position signals for decision making.
"""

import time
import threading
from nanonis_control import NanonisConnection

BIAS_IDX = 24
Z_IDX = 30

BIAS_RANGE = (0, 2.0)
Z_RANGE = (-500e-9, 400e-9)

def decision_making_thread(control_nanonis, signal_indices):
    """Simple decision thread that checks if signals are within acceptable bounds."""
    print("Decision thread started - monitoring signal bounds")
    while True:
        try:
            # Get current means from the monitoring connection
            means = control_nanonis.get_all_signal_means("monitor")
            
            if not means or len(means) < 2:
                time.sleep(0.5)
                continue
            
            bias_mean = means.get(bias_idx, 0.0)
            z_mean = means.get(z_idx, 0.0)
            
            # Only make decisions if we have enough samples
            bias_samples = control_nanonis.get_signal_sample_count(bias_idx, "monitor")
            z_samples = control_nanonis.get_signal_sample_count(z_idx, "monitor")
            
            if bias_samples >= 10 and z_samples >= 10:
                # Check bias bounds
                if bias_min <= bias_mean <= bias_max:
                    bias_status = "✓ OK"
                else:
                    bias_status = "⚠ OUT OF BOUNDS"
                
                # Check Z bounds  
                if z_min <= z_mean <= z_max:
                    z_status = "✓ OK"
                else:
                    z_status = "⚠ OUT OF BOUNDS"
                
                # Print status every few seconds
                print(f"Signal Status - Bias: {bias_mean:.3f}V {bias_status}, Z: {z_mean:.2e}m {z_status}")
                
                # Alert if both are out of bounds
                if bias_status.startswith("⚠") and z_status.startswith("⚠"):
                    print("ALERT: Both signals are out of acceptable bounds!")
            
            time.sleep(3.0)  # Check every 3 seconds
            
        except KeyboardInterrupt:
            break
        except Exception as e:
            print(f"Decision thread error: {e}")
            break
    
    print("Decision thread stopped")


def main():
    """Main example demonstrating separate connections for monitoring vs control."""
    
    # Connection 1: Control operations (port 6501)
    with NanonisConnection(host="127.0.0.1", port=6501) as control_nanonis:
        print("Connected to Nanonis for control operations (port 6501)")
        
        # Find the right signal indices
        signal_indices = find_signal_indices(control_nanonis)
        bias_idx = signal_indices["bias"]
        z_idx = signal_indices["z_pos"]
        
        # Start signal monitoring using separate connection (port 6502)
        print("Starting signal monitoring on separate connection (port 6502)...")
        control_nanonis.start_signal_monitoring(
            [bias_idx, z_idx], 
            window_size=10, 
            sample_rate=5,
            monitor_id="monitor",
            separate_connection=("127.0.0.1", 6502)
        )
        
        # Start decision-making thread
        decision_thread = threading.Thread(
            target=decision_making_thread, 
            args=(control_nanonis, signal_indices), 
            daemon=True
        )
        decision_thread.start()
        
        # Monitor for a while, showing real-time data
        try:
            print("Monitoring signals (Ctrl+C to stop)...")
            for i in range(60):  # Run for 1 minute
                time.sleep(1)
                
                # Get current means from monitoring connection
                means = control_nanonis.get_all_signal_means("monitor")
                
                # Get instant readings from control connection for comparison
                try:
                    instant_bias = control_nanonis.read_signal_instant(bias_idx)
                    instant_z = control_nanonis.read_signal_instant(z_idx)
                except Exception as e:
                    instant_bias = instant_z = 0.0
                    print(f"Warning: Could not read instant values: {e}")
                
                bias_samples = control_nanonis.get_signal_sample_count(bias_idx, "monitor")
                z_samples = control_nanonis.get_signal_sample_count(z_idx, "monitor")
                
                print(f"Time {i+1}s:")
                print(f"  Bias - Mean: {means.get(bias_idx, 0):.3f}V, Instant: {instant_bias:.3f}V")
                print(f"  Z(m) - Mean: {means.get(z_idx, 0):.2e}m, Instant: {instant_z:.2e}m")
                print(f"  Samples: Bias={bias_samples}, Z={z_samples}")
                print()
                
        except KeyboardInterrupt:
            print("\nStopped by user")
        
        # Signal monitoring is automatically stopped when exiting the context manager
        print("Signal monitoring stopped")


def test_all_ports():
    """Test connections to all available ports."""
    ports = [6501, 6502, 6503, 6504]
    
    for port in ports:
        try:
            with NanonisConnection(host="127.0.0.1", port=port) as nanonis:
                signals = nanonis.get_available_signals()
                print(f"✓ Port {port}: Connected - {len(signals) if signals else 0} signals available")
        except Exception as e:
            print(f"✗ Port {port}: Failed - {e}")


if __name__ == "__main__":
    print("Testing connections to all ports...")
    test_all_ports()
    print()
    
    try:
        main()
    except Exception as e:
        print(f"Error: {e}")
        print("Make sure Nanonis is running with TCP servers on ports 6501 and 6502")
