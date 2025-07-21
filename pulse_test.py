import time
import numpy as np
import random
from nanonis_client import NanonisConnection

with NanonisConnection() as nanonis:
    # nanonis.returnDebugInfo(1)

    nanonis.FolMe_SpeedSet(3e-9, 1)

    x_pos = random.uniform(0e-9, 10e-9)
    y_pos = random.uniform(0e-9, 10e-9)

    print(f"Moving to x: {x_pos} y: {y_pos}")
    nanonis.FolMe_XYPosSet(x_pos, y_pos, 0)

    nanonis.Bias_Pulse(1, 1, 4, 0, 0)


    print(nanonis.Signals_NamesGet())

    
