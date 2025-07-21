import time
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from nanonis_client import NanonisConnection

with NanonisConnection() as nanonis:
    # Start auto-approach and wait for completion
    nanonis.auto_approach_and_wait()
    
    # Start scan
    nanonis.Scan_Action(0, 1)
    
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
                print("Scan complete")
                scan_complete = True
    
    # Update every ... seconds
    anim = FuncAnimation(fig, update, interval=100, cache_frame_data=False)
    
    try:
        plt.show()
    except KeyboardInterrupt:
        pass
