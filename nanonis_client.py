import socket
import time
import threading
from collections import deque
from statistics import mean
import nanonis_spm


class SignalMonitor:
    """Thread-safe signal monitor that provides moving averages."""
    
    def __init__(self, nanonis_or_connection_info, signal_indices, window_size=100, sample_rate=10):
        if isinstance(signal_indices, int):
            signal_indices = [signal_indices]
        
        # Handle both existing nanonis object or separate connection info
        if isinstance(nanonis_or_connection_info, tuple):
            # Separate connection: (host, port)
            self.host, self.port = nanonis_or_connection_info
            self.nanonis = None  # Will be created in reader thread
            self.own_connection = True
        else:
            # Shared nanonis object
            self.nanonis = nanonis_or_connection_info
            self.own_connection = False
            
        self.signal_indices = signal_indices
        self.window_size = window_size
        self.sample_rate = sample_rate
        self.sample_interval = 1.0 / sample_rate
        
        # Thread-safe data structures
        self._data_windows = {idx: deque(maxlen=window_size) for idx in signal_indices}
        self._current_means = {idx: 0.0 for idx in signal_indices}
        self._lock = threading.RLock()
        
        # Control
        self._shutdown = threading.Event()
        self._running = False
        self._reader_thread = None
        
    def start(self):
        """Start the signal reading thread."""
        if self._running:
            return
            
        self._running = True
        self._shutdown.clear()
        self._reader_thread = threading.Thread(target=self._reader_loop, daemon=True)
        self._reader_thread.start()
        
    def stop(self):
        """Stop the signal reading thread."""
        if not self._running:
            return
            
        self._shutdown.set()
        self._running = False
        if self._reader_thread:
            self._reader_thread.join(timeout=2.0)
            
    def get_current_mean(self, signal_index):
        """Get current moving average for a signal (thread-safe)."""
        with self._lock:
            return self._current_means.get(signal_index, 0.0)
            
    def get_all_means(self):
        """Get current moving averages for all signals (thread-safe)."""
        with self._lock:
            return self._current_means.copy()
            
    def get_sample_count(self, signal_index):
        """Get number of samples in the window for a signal."""
        with self._lock:
            return len(self._data_windows.get(signal_index, deque()))
            
    def _reader_loop(self):
        """Background thread that reads signals and calculates moving averages."""
        connection = None
        nanonis = self.nanonis
        
        try:
            # Create own connection if needed
            if self.own_connection:
                connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                connection.connect((self.host, self.port))
                nanonis = nanonis_spm.Nanonis(connection)
                print(f"SignalMonitor: Connected to {self.host}:{self.port}")
            
            while not self._shutdown.is_set():
                try:
                    # Read multiple signals at once for efficiency
                    if len(self.signal_indices) == 1:
                        value = nanonis.Signals_ValGet(self.signal_indices[0], True)[2][0]
                        values = [value]
                    else:
                        result = nanonis.Signals_ValsGet(self.signal_indices, True)[2][1]
                        # result is a list of tuples, extract the first element of each tuple
                        values = [val[0] if isinstance(val, tuple) else val for val in result]
                    
                    # Update data windows and calculate means
                    with self._lock:
                        for i, signal_idx in enumerate(self.signal_indices):
                            self._data_windows[signal_idx].append(values[i])
                            if len(self._data_windows[signal_idx]) > 0:
                                self._current_means[signal_idx] = mean(self._data_windows[signal_idx])
                    
                    time.sleep(self.sample_interval)
                    
                except Exception as e:
                    if not self._shutdown.is_set():
                        print(f"Error reading signals: {e}")
                    time.sleep(0.1)
                    
        except Exception as e:
            print(f"SignalMonitor: Failed to connect to {getattr(self, 'host', 'nanonis')}: {e}")
            
        finally:
            if connection:
                connection.close()
                print(f"SignalMonitor: Disconnected from {self.host}:{self.port}")


class NanonisController:
    """High-level controller with convenience methods for common operations."""
    
    def __init__(self, nanonis):
        self._nanonis = nanonis
    
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
    
    def __getattr__(self, name):
        """Delegate all other methods to the underlying nanonis object."""
        return getattr(self._nanonis, name)


class NanonisConnection:
    """Context manager for Nanonis TCP connections.
    
    Usage:
        with NanonisConnection() as nano:
            nano.auto_approach_and_wait()
            nano.Scan_Action(0, 1)
    """
    
    def __init__(self, host="127.0.0.1", port=6501):
        self.host = host
        self.port = port
        self.connection = None
        self.nanonis = None
        self.controller = None
    
    def __enter__(self):
        self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.connection.connect((self.host, self.port))
        nanonis = nanonis_spm.Nanonis(self.connection)
        self.controller = NanonisController(nanonis)
        return self.controller
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        # Stop any active signal monitors before closing connection
        if self.controller:
            self.controller.stop_all_signal_monitoring()
        if self.connection:
            self.connection.close()


def connect_nanonis(host="127.0.0.1", port=6501):
    """Simple function to create a Nanonis connection.
    
    Returns:
        tuple: (connection, nanonis) - Remember to close connection manually
    """
    connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    connection.connect((host, port))
    return connection, nanonis_spm.Nanonis(connection)
