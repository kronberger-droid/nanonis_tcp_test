#!/usr/bin/env python3
"""
Debug script to check signal value reading.
"""

from nanonis_client import NanonisConnection

with NanonisConnection() as nanonis:
    try:
        # Test single signal reading
        print("=== Single Signal Reading ===")
        result_single = nanonis.Signals_ValGet(24, True)  # Bias signal
        print(f"Single signal result: {result_single}")
        print(f"Type: {type(result_single)}")
        if hasattr(result_single, '__len__') and len(result_single) > 2:
            print(f"result_single[2]: {result_single[2]}")
            print(f"result_single[2] type: {type(result_single[2])}")
            if hasattr(result_single[2], '__len__') and len(result_single[2]) > 0:
                print(f"result_single[2][0]: {result_single[2][0]} (type: {type(result_single[2][0])})")
        
        print("\n=== Multiple Signal Reading ===")
        result_multi = nanonis.Signals_ValsGet([24, 30], True)  # Bias and Z
        print(f"Multi signal result: {result_multi}")
        print(f"Type: {type(result_multi)}")
        if hasattr(result_multi, '__len__') and len(result_multi) > 2:
            print(f"result_multi[2]: {result_multi[2]}")
            print(f"result_multi[2] type: {type(result_multi[2])}")
            if hasattr(result_multi[2], '__len__') and len(result_multi[2]) > 1:
                print(f"result_multi[2][0]: {result_multi[2][0]} (type: {type(result_multi[2][0])})")
                print(f"result_multi[2][1]: {result_multi[2][1]} (type: {type(result_multi[2][1])})")
                
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()