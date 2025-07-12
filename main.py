import nanonis_spm
import time
import socket

connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

connection.connect(("127.0.0.1", 6501))

nanonisInstance = nanonis_spm.Nanonis(connection)

import nanonis_spm_examples

# nanonis_spm_examples.Example_AutoApproach
nanonisInstance.returnDebugInfo(1)

nanonisInstance.Bias_Get()
nanonisInstance.Bias_Set(4.0)

nanonisInstance.FolMe_XYPosGet(True)
nanonisInstance.FolMe_XYPosSet(1e-9, 1e-9, True)
