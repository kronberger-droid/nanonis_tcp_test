import socket
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import nanonis_spm

# Connect
connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
connection.connect(("127.0.0.1", 6501))
nanonis = nanonis_spm.Nanonis(connection)

# Start scan
nanonis.Scan_Action(0, 1)
print("Scan started")

# Set up plot
fig, ax = plt.subplots()
im = None
scan_complete = False

def update(frame):
    global im, scan_complete
    
    # Get data
    result = nanonis.Scan_FrameDataGrab(0, 1)[2]
    
    if len(result) >= 5:
        _, channel_name, num_rows, num_cols, data, shape = result
        
        if im is None:
            im = ax.imshow(data, cmap='viridis')
            plt.colorbar(im)
            ax.set_title(channel_name)
        else:
            im.set_array(data)
        
        # Check if done
        if nanonis.Scan_StatusGet() == 0 and not scan_complete:
            ax.set_title(f"{channel_name} - Complete")
            connection.close()
            print("Scan complete - connection closed")
            scan_complete = True

# Update every 2 seconds
anim = FuncAnimation(fig, update, interval=100, cache_frame_data=False)

try:
    plt.show()
except KeyboardInterrupt:
    pass
finally:
    if not scan_complete:
        connection.close()
        print("Connection closed")
