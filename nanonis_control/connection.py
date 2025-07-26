import socket
import nanonis_spm
from .controller import NanonisController


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