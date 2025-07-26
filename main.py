#!/usr/bin/env python3
"""
Nanonis SPM Control - Main CLI Interface
"""
import sys
import os

# Add examples to path so we can import them
sys.path.append(os.path.join(os.path.dirname(__file__), 'examples'))

from nanonis_control import NanonisConnection


def show_menu():
    """Display available operations"""
    print("\n=== Nanonis SPM Control ===")
    print("1. Scan Test (real-time visualization)")
    print("2. Tip Preparation") 
    print("3. Integrated Monitoring Example")
    print("4. List All Signal Names")
    print("5. Debug Signal Values")
    print("6. Adaptive Control System")
    print("=" * 27)


def run_scan_test():
    """Import and run scan test"""
    try:
        import scan_test
        print("Scan test completed!")
    except ImportError as e:
        print(f"Could not import scan_test: {e}")
    except Exception as e:
        print(f"Error running scan test: {e}")


def run_tip_preparation():
    """Import and run tip preparation"""
    try:
        import tip_prep_test
        print("Tip preparation completed!")
    except ImportError as e:
        print(f"Could not import tip_prep_test: {e}")
    except Exception as e:
        print(f"Error running tip preparation: {e}")


def run_integrated_example():
    """Import and run integrated monitoring example"""
    try:
        import example_integrated_usage
        print("Integrated example completed!")
    except ImportError as e:
        print(f"Could not import example_integrated_usage: {e}")
    except Exception as e:
        print(f"Error running integrated example: {e}")


def run_get_signal_names():
    """List all available signal names"""
    try:
        with NanonisConnection() as nanonis:
            names = nanonis.get_available_signals()
            print(names)
        
    except Exception as e:
        print(f"Error getting signal names: {e}")


def run_debug_signal_values():
    """Debug signal values"""
    try:
        import debug_signal_values
        print("Signal value debugging completed!")
    except ImportError as e:
        print(f"Could not import debug_signal_values: {e}")
    except Exception as e:
        print(f"Error debugging signal values: {e}")


def run_adaptive_control():
    """Run adaptive control system"""
    try:
        import adaptive_control
        adaptive_control.main()
        print("Adaptive control completed!")
    except ImportError as e:
        print(f"Could not import adaptive_control: {e}")
    except Exception as e:
        print(f"Error running adaptive control: {e}")


def main():
    """Main command-line interface"""
    print("Welcome to Nanonis SPM Control!")
    
    while True:
        show_menu()
        
        try:
            choice = input("Select operation: ").strip()
            
            if choice == "1":
                run_scan_test()
            elif choice == "2":
                run_tip_preparation()
            elif choice == "3":
                run_integrated_example()
            elif choice == "4":
                run_get_signal_names()
            elif choice == "5":
                run_debug_signal_values()
            elif choice == "6":
                run_adaptive_control()
            else:
                print("Invalid choice. Please try again.")
                
        except KeyboardInterrupt:
            print("\nInterrupted. Goodbye!")
            break
        except Exception as e:
            print(f"Error: {e}")


if __name__ == "__main__":
    main()
