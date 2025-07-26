#!/usr/bin/env python3
"""
Debug script to check signal value reading.
"""

import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(__file__)))
from nanonis_control import NanonisConnection

with NanonisConnection() as nanonis:
    try:
        signals = nanonis.get_available_signals()
        signal_ids = list(range(len(signals)))
        result = nanonis.Signals_ValsGet(signal_ids, True)

        print(f"{'ID':3s} | {'Signal Name':30s} | {'Value':>10s}")
        print("-" * 50)

        for signal_id, name, value in zip(signal_ids, signals, result[2][1]):
            value = float(value[0])

            if value != 0.0:
                print(f"{signal_id:3d} | {name:30s} | {value}")
                
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
