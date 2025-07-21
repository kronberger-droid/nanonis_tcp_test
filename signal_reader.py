import time
import numpy as np
import matplotlib.pyplot as plt
from nanonis_client import NanonisConnection

def read_oscilloscope_signals(duration=10, channel=1, plot_realtime=True):
    """Read signals from Nanonis oscilloscope.
    
    Args:
        duration: How long to read signals (seconds)
        channel: Oscilloscope channel number
        plot_realtime: Whether to plot signals in real-time
    """
    
    with NanonisConnection() as nanonis:
        print(f"Reading oscilloscope signals from channel {channel} for {duration}s...")

        
            
if __name__ == "__main__":
    print("Starting signal reading test...")
    
    with NanonisConnection() as nanonis:
        print(f"Reading oscilloscope signals from channel {channel} for {duration}s...")
