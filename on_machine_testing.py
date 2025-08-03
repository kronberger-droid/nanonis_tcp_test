import time
import numpy as np
import random
from nanonis_client import NanonisConnection

with NanonisConnection() as nanonis:
    nanonis.returnDebugInfo(1)

    # --- Check Signal Names ---
    nanonis.Signals_NamesGet()

    time.sleep(1)

    # --- Auto Approach and Wait ---
    verbose = True
    
    nanonis.auto_approach_and_wait(verbose)

    time.sleep(1)

    # --- Test Bias pulse ---
    until_finshed = True
    pulse_width = 0.1
    pulse_value = 2
    z_hold = True
    relative_or_absolute = 0 # means no change
    
    nanonis.Bias_Pulse(until_finshed, pulse_width, pulse_value, z_hold, relative_or_absolute)

    time.sleep(1)

    # # --- Test Motor Pos Get --- 
    # group = 0 # Check inside motor controll module
    # timeout = 500
        
    # nanonis.Motor_PosGet(group, timeout)

    # time.sleep(1)

    # # --- Test Motor Start Move ---
    # x_plus_dir = 0
    # y_plus_dir = 2
    # num_steps = 2
    # until_finished = True

    # # move in the X+ direction
    # nanonis.Motor_StartMove(x_plus_dir, num_steps, group, until_finished)

    # # move in the Y+ direction
    # nanonis.Motor_StartMove(y_plus_dir, num_steps, group, until_finished)

    # time.sleep(1)
    
