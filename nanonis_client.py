import socket
import time
import nanonis_spm


class NanonisController:
    """Nanonis controller with convenience methods."""
    
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
    
    def __enter__(self):
        self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.connection.connect((self.host, self.port))
        nanonis = nanonis_spm.Nanonis(self.connection)
        return NanonisController(nanonis)
    
    def __exit__(self, exc_type, exc_val, exc_tb):
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