import time
import numpy as np
import matplotlib.pyplot as plt
from nanonis_client import NanonisConnection

def read_signal_mean(signal_index, time_window=1.0, sample_rate=100):
    """Read a signal and return the mean over a time window.
    
    Args:
        signal_index: Signal index (0-127) to read
        time_window: Duration in seconds to sample
        sample_rate: Samples per second
        
    Returns:
        float: Mean value of signal over the time window
    """
    
    with NanonisConnection() as nanonis:
        samples = []
        sample_interval = 1.0 / sample_rate
        end_time = time.time() + time_window
        
        while time.time() < end_time:
            try:
                value = nanonis.Signals_ValGet(signal_index, True)[2][0]
                samples.append(value)
                time.sleep(sample_interval)
            except Exception as e:
                print(f"Error reading signal {signal_index}: {e}")
                break
        
        if samples:
            return np.mean(samples)
        else:
            return None

def read_multiple_signals_mean(signal_indices, time_window=1.0, sample_rate=100):
    """Read multiple signals and return their means over a time window.
    
    Args:
        signal_indices: List of signal indices (0-127) to read
        time_window: Duration in seconds to sample
        sample_rate: Samples per second
        
    Returns:
        dict: Signal index -> mean value mapping
    """
    
    with NanonisConnection() as nanonis:
        all_samples = {idx: [] for idx in signal_indices}
        sample_interval = 1.0 / sample_rate
        end_time = time.time() + time_window
        
        while time.time() < end_time:
            try:
                values = nanonis.Signals_ValsGet(signal_indices, True)[2][1]
                for i, signal_idx in enumerate(signal_indices):
                    all_samples[signal_idx].append(values[i])
                time.sleep(sample_interval)
            except Exception as e:
                print(f"Error reading signals {signal_indices}: {e}")
                break
        
        means = {}
        for signal_idx in signal_indices:
            if all_samples[signal_idx]:
                means[signal_idx] = np.mean(all_samples[signal_idx])
            else:
                means[signal_idx] = None
        
        return means

def get_available_signals():
    """Get list of all available signal names and indices.
    
    Returns:
        list: List of signal names (index = position in list)
    """
    
    with NanonisConnection() as nanonis:
        try:
            result = nanonis.Signals_NamesGet()
            signal_names = result[2][1]  # Signal names are in [2][1]
            return signal_names
        except Exception as e:
            print(f"Error getting signal names: {e}")
            return []

def test_connection():
    """Test if Nanonis connection is working."""
    try:
        with NanonisConnection() as nanonis:
            print("✓ Connected to Nanonis")
            return True
    except Exception as e:
        print(f"✗ Failed to connect to Nanonis: {e}")
        return False

if __name__ == "__main__":
    print("Starting signal reading test...")
    
    # Test connection first
    if not test_connection():
        print("Please ensure Nanonis is running and accessible on 127.0.0.1:6501")
        exit(1)
    
    # Get available signals
    signals = get_available_signals()
    if signals and isinstance(signals, list):
        print(f"Available signals: {signals[:5]}...")  # Show first 5
    else:
        print(f"No signals available or error: {signals}")
        
    # Test single signal reading (Current signal - index 0)
    print("Testing single signal reading...")
    current_mean = read_signal_mean(0, time_window=1.0, sample_rate=10)
    print(f"Current signal mean over 1s: {current_mean}")
    
    # Test multiple signal reading (Current and Bias)
    print("Testing multiple signal reading...")
    means = read_multiple_signals_mean([0, 24], time_window=1.0, sample_rate=10)
    print(f"Multiple signals means: {means}")
