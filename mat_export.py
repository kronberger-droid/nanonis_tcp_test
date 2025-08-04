#!/usr/bin/env python3
import h5py
import numpy as np
import json

def extract_mat_file(filename):
    with h5py.File(filename, 'r') as f:
        print("Variables in the MAT file:")
        
        def print_structure(name, obj):
            if isinstance(obj, h5py.Dataset):
                print(f"  {name}: shape={obj.shape}, dtype={obj.dtype}")
        
        f.visititems(print_structure)
        
        # Extract all datasets
        data = {}
        metadata = {}
        
        def extract_dataset(name, obj):
            if isinstance(obj, h5py.Dataset):
                # Convert to numpy array
                arr = obj[:]
                
                # Save as .npy file (binary, fast to load in Rust)
                safe_name = name.replace('/', '_')
                np.save(f"{safe_name}.npy", arr)
                
                # Store metadata
                metadata[name] = {
                    'shape': list(arr.shape),
                    'dtype': str(arr.dtype),
                    'filename': f"{safe_name}.npy"
                }
                
                print(f"Exported {name} -> {safe_name}.npy")
        
        f.visititems(extract_dataset)
        
        # Save metadata as JSON
        with open('metadata.json', 'w') as meta_file:
            json.dump(metadata, meta_file, indent=2)
        
        print("Metadata saved to metadata.json")

if __name__ == "__main__":
    extract_mat_file("/home/kronberger/Downloads/LineDataNewNew128.mat")
