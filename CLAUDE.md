# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Python project for testing and controlling Nanonis SPM (Scanning Probe Microscopy) software via TCP communication. The project provides a high-level client library and various test scripts for SPM operations.

## Architecture

### Core Components

- **`nanonis_client.py`**: Main client library with three key classes:
  - `NanonisConnection`: Context manager for TCP connections (lines 269-298)
  - `NanonisController`: High-level controller with convenience methods (lines 124-267)
  - `SignalMonitor`: Thread-safe signal monitoring with moving averages (lines 9-122)

- **Test Scripts**: Various example and test scripts demonstrating usage patterns:
  - `example_integrated_usage.py`: Multi-threaded approach with separate monitoring/control connections
  - `scan_test.py`: Real-time scan visualization with matplotlib
  - `tip_prep_test.py`: Tip preparation procedures
  - `debug_*.py`: Signal debugging utilities

### Key Patterns

The architecture supports two connection patterns:
1. **Shared Connection**: Single TCP connection for both control and monitoring
2. **Separate Connections**: Dedicated connections for control vs. signal monitoring (recommended for real-time applications)

Signal monitoring uses threaded background reading with configurable moving averages and thread-safe data access.

## Development Environment

The project uses Nix flakes for environment management:

### Environment Setup
```bash
# Enter development shell (includes all dependencies)
nix develop

# Enter default shell (includes nushell)
nix develop .#default
```

### Available Packages
- Python 3.13.4 with:
  - `nanonis_spm` (1.0.8) - TCP protocol implementation
  - `matplotlib` (3.10.3) - Plotting and visualization
  - `numpy` (2.3.0) - Numerical operations

## Common Development Tasks

### Running Scripts
```bash
# Basic connection test
python nanonis_client.py

# Real-time scan with visualization
python scan_test.py

# Multi-threaded monitoring example
python example_integrated_usage.py

# Signal debugging
python debug_signals.py
python get_signal_names.py
```

### Testing Connections
The default Nanonis TCP connection is `127.0.0.1:6501`. All scripts use this as default but can be modified for different hosts/ports.

## Protocol Documentation

- `TCPProtocol_SPM.pdf`: Official Nanonis TCP protocol specification
- `tcpprotocol.typ`: Additional protocol documentation

## Usage Patterns

### Basic Connection
```python
from nanonis_client import NanonisConnection

with NanonisConnection() as nano:
    nano.auto_approach_and_wait()
    signals = nano.get_available_signals()
```

### Signal Monitoring
```python
# Start monitoring with moving averages
monitor = nano.start_signal_monitoring([24, 8], window_size=100, sample_rate=10)
current_mean = nano.get_signal_mean(24)
```

### Separate Connections (for intensive monitoring)
```python
# Control connection
with NanonisConnection() as control:
    # Monitoring connection (separate)
    monitor = control.start_signal_monitoring([24, 8], 
                                            separate_connection=("127.0.0.1", 6501))
```