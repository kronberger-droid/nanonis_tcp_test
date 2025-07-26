import time
from .monitoring import SignalMonitor


class NanonisController:
    """Nanonis controller with convenience methods."""
    
    def __init__(self, nanonis):
        self._nanonis = nanonis
        self._signal_monitors = {}
    
    def auto_approach_and_wait(self, verbose=True):
        """Start auto-approach and wait until it completes."""
        if verbose:
            print("Starting auto-approach...")
        
        self._nanonis.AutoApproach_Open()
        time.sleep(1)
        self._nanonis.AutoApproach_OnOffSet(1)
        
        if verbose:
            print("Waiting for auto-approach to complete...")
        
        while self._nanonis.AutoApproach_OnOffGet()[2][0] == 1:
            time.sleep(0.1)
        
        if verbose:
            print("Auto-approach finished")
    
    def start_signal_monitoring(self, signal_indices, window_size=100, sample_rate=10, monitor_id="default", separate_connection=None):
        """Start continuous signal monitoring with moving averages.
        
        Args:
            signal_indices: Signal index or list of indices to monitor
            window_size: Number of samples for moving average
            sample_rate: Samples per second
            monitor_id: Unique identifier for this monitor (allows multiple monitors)
            separate_connection: Tuple (host, port) for dedicated connection, or None to share controller's connection
            
        Returns:
            SignalMonitor: The monitor instance for direct access if needed
        """
        if monitor_id in self._signal_monitors:
            self._signal_monitors[monitor_id].stop()
        
        if separate_connection:
            monitor = SignalMonitor(separate_connection, signal_indices, window_size, sample_rate)
        else:
            monitor = SignalMonitor(self._nanonis, signal_indices, window_size, sample_rate)
            
        monitor.start()
        self._signal_monitors[monitor_id] = monitor
        return monitor
    
    def stop_signal_monitoring(self, monitor_id="default"):
        """Stop signal monitoring for a specific monitor."""
        if monitor_id in self._signal_monitors:
            self._signal_monitors[monitor_id].stop()
            del self._signal_monitors[monitor_id]
    
    def stop_all_signal_monitoring(self):
        """Stop all active signal monitors."""
        for monitor in self._signal_monitors.values():
            monitor.stop()
        self._signal_monitors.clear()
    
    def get_signal_mean(self, signal_index, monitor_id="default"):
        """Get current moving average for a signal.
        
        Args:
            signal_index: Signal index to get mean for
            monitor_id: Which monitor to get the mean from
            
        Returns:
            float: Current moving average, or 0.0 if monitor not found
        """
        if monitor_id in self._signal_monitors:
            return self._signal_monitors[monitor_id].get_current_mean(signal_index)
        return 0.0
    
    def get_all_signal_means(self, monitor_id="default"):
        """Get current moving averages for all monitored signals.
        
        Args:
            monitor_id: Which monitor to get means from
            
        Returns:
            dict: Signal index -> mean value mapping
        """
        if monitor_id in self._signal_monitors:
            return self._signal_monitors[monitor_id].get_all_means()
        return {}
    
    def get_signal_sample_count(self, signal_index, monitor_id="default"):
        """Get number of samples collected for a signal.
        
        Args:
            signal_index: Signal index
            monitor_id: Which monitor to check
            
        Returns:
            int: Number of samples in the moving average window
        """
        if monitor_id in self._signal_monitors:
            return self._signal_monitors[monitor_id].get_sample_count(signal_index)
        return 0
    
    def read_signal_instant(self, signal_index):
        """Read a single signal value instantly (no averaging).
        
        Args:
            signal_index: Signal index to read
            
        Returns:
            float: Current signal value
        """
        return self._nanonis.Signals_ValGet(signal_index, True)[2][0]
    
    def read_multiple_signals_instant(self, signal_indices):
        """Read multiple signal values instantly (no averaging).
        
        Args:
            signal_indices: List of signal indices to read
            
        Returns:
            list: Current signal values in same order as indices
        """
        result = self._nanonis.Signals_ValsGet(signal_indices, True)[2][1]
        # result is a list of tuples, extract the first element of each tuple
        return [val[0] if isinstance(val, tuple) else val for val in result]
    
    def get_available_signals(self):
        """Get list of all available signal names.
        
        Returns:
            list: Signal names (index = position in list)
        """
        try:
            result = self._nanonis.Signals_NamesGet()
            return result[2][2]
        except Exception as e:
            print(f"Error getting signal names: {e}")
            return []
    
    def __getattr__(self, name):
        """Delegate all other methods to the underlying nanonis object."""
        return getattr(self._nanonis, name)
