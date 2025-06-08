import os
import time

def clear_screen():
    """Clear the console screen"""
    os.system('cls' if os.name == 'nt' else 'clear')

def move_cursor_to_top():
    """Move cursor to top of console without clearing"""
    if os.name == 'nt':  # Windows
        os.system('cls')
    else:  # Unix/Linux/Mac
        print('\033[H', end='')

def display_values(fx, looperState, oldLooperState, data_lock):
    """Display the current values in a table format"""
    with data_lock:
        current_fx = fx.copy()
        current_looper = looperState
        current_old_looper = oldLooperState

    # Move cursor to top
    move_cursor_to_top()

    # Create the display
    print("=" * 60)
    print("           AUDIO EFFECTS MONITOR")
    print("=" * 60)
    print()
    # Main effects table
    print("┌─────────────┬─────────┬─────────────┬─────────┐")
    print("│ PARAMETER   │  VALUE  │ PARAMETER   │  VALUE  │")
    print("├─────────────┼─────────┼─────────────┼─────────┤")
    print(f"│ WET         │ {current_fx['wet']:7.3f} │ CHORUS      │ {current_fx['chorus']:7.3f} │")
    print(f"│ DRY         │ {current_fx['dry']:7.3f} │ REVERB      │ {current_fx['reverb']:7.3f} │")
    print(f"│ BASS        │ {current_fx['bass']:7.3f} │ DISTORT     │ {current_fx['distort']:7.3f} │")
    print(f"│ MID         │ {current_fx['mid']:7.3f} │ WAH         │ {current_fx['wah']:7.3f} │")
    print(f"│ TREBLE      │ {current_fx['treb']:7.3f} │             │         │")
    print("└─────────────┴─────────┴─────────────┴─────────┘")
    print()
    # Looper state
    print("┌─────────────────────────────────────────────────┐")
    print("│                 LOOPER STATUS                   │")
    print("├─────────────────────────────────────────────────┤")
    print(f"│ Current State: {current_looper:15s}         │")
    print(f"│ Previous State: {current_old_looper:14s}         │")
    print("└─────────────────────────────────────────────────┘")
    print()
    # Add some padding to prevent screen flickering
    print("\n" * 5)
    print("Press Ctrl+C to exit...")

def display_loop(fx, looperState, oldLooperState, data_lock):
    """Continuously update the display"""
    clear_screen()
    while True:
        try:
            display_values(fx, looperState, oldLooperState, data_lock)
            time.sleep(0.1)
        except KeyboardInterrupt:
            break