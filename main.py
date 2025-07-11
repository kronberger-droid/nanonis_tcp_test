import nanonis_spm
import time
import socket

connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

connection.connect(("127.0.0.1", 6501))

nanonisInstance = nanonis_spm.Nanonis(connection)

import nanonis_spm_examples

# nanonis_spm_examples.Example_AutoApproach
nanonisInstance.returnDebugInfo(1)

loops = 20
steps = 2000

for loop in range(loops):
    nanonisInstance.Motor_StartMove(1, steps, 0, 1)  # Axis 1=X, positive direction, wait=1
    time.sleep(0.5)
    
    nanonisInstance.Motor_StartMove(2, steps, 0, 1)  # Axis 2=Y, positive direction, wait=1
    time.sleep(0.5)
    
    nanonisInstance.Motor_StartMove(1, steps, 1, 1)  # Axis 1=X, negative direction, wait=1
    time.sleep(0.5)
    
    nanonisInstance.Motor_StartMove(2, steps, 1, 1)  # Axis 2=Y, negative direction, wait=1
    time.sleep(0.5)
