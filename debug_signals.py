#!/usr/bin/env python3
"""
Debug script to check what the Signals_NamesGet() method returns.
"""

from nanonis_client import NanonisConnection

with NanonisConnection() as nanonis:
    try:
        result = nanonis.Signals_NamesGet()
        print("Full result:", result)
        print("Result type:", type(result))
        print("Result length:", len(result) if hasattr(result, '__len__') else "No length")
        
        if hasattr(result, '__len__') and len(result) > 2:
            print("result[0]:", result[0])
            print("result[1]:", result[1])
            print("result[2]:", result[2])
            
            if hasattr(result[2], '__len__') and len(result[2]) > 1:
                print("result[2][0]:", result[2][0])
                print("result[2][1]:", result[2][1])
                print("result[2][1] type:", type(result[2][1]))
                
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()