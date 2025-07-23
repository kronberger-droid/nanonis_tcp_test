import numpy as np
from nanonis_client import NanonisConnection

with NanonisConnection() as nanonis:
    nanonis.returnDebugInfo(1)

    pulse_width = 0.1
    pulse_bias = 4

    dx = 2e-9
    dy = 2e-9

    for i in range(10):
        nanonis.auto_approach_and_wait(True) 
        nanonis.Bias_Pulse(1, 0.1, 2, 0, 0)
        nanonis.ZCtrl_Withdraw(1, 0.5)

        # nanonis.Motor_StartMove(0, 2, 0, True)
        # nanonis.Motor_StartMove(2, 2, 0, True)
        x, y = nanonis.FolMe_XYPosGet(1)[2]

        nanonis.FolMe_XYPosSet(x + dx, y + dy, True)

        nanonis.auto_approach_and_wait(True)

        print(nanonis.Signals_ValGet(1, True))
