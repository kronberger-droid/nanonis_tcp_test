import time
import numpy as np
from nanonis_client import NanonisConnection

with NanonisConnection() as nanonis:
  
    # nanonis.auto_approach_and_wait()
   
    nanonis.returnDebugInfo(1)

    print(nanonis.FolMe_SpeedGet())

    nanonis.FolMe_SpeedSet(3e-9, 1)
    nanonis.FolMe_XYPosSet(0e-9, 0e-9, 0)
    nanonis.FolMe_XYPosGet(0)
    nanonis.FolMe_XYPosSet(5e-9, 5e-9, 0)
