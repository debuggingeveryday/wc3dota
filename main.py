import subprocess
import time
from pynput import keyboard

controller = keyboard.Controller()
running = True

TARGET_WINDOW_NAME = "Warcraft III"

IS_WINDOW_ACTIVE = False

COLUMN_ONE = 79.68
COLUMN_TWO = 85.15
COLUMN_THREE = 90.63
COLUMN_FOUR = 96.32

ROW_ONE = 81.94
ROW_TWO = 88.88
ROW_THREE = 95.83


# ----------------------------
# helpers
# ----------------------------

def run(cmd):
    return subprocess.check_output(cmd).decode().strip()


def get_active_window():
    return run(["xdotool", "getactivewindow"])


def get_window_name(window_id):
    try:
        return run(["xdotool", "getwindowname", window_id])
    except subprocess.CalledProcessError:
        return ""


def get_mouse():
    out = run(["xdotool", "getmouselocation", "--shell"])
    data = {}
    for line in out.splitlines():
        if "=" in line:
            k, v = line.split("=")
            data[k] = int(v)
    return data["X"], data["Y"]


def get_window_geometry(window_id):
    out = run(["xdotool", "getwindowgeometry", "--shell", window_id])
    data = {}
    for line in out.splitlines():
        if "=" in line:
            k, v = line.split("=")
            data[k] = int(v)
    return data["X"], data["Y"], data["WIDTH"], data["HEIGHT"]


# ----------------------------
# same as your bash function (converted)
# ----------------------------

def skill_location_q(width, height):
    x = width * (COLUMN_ONE / 100)
    y = height * (ROW_THREE / 100)

    rx = round(x)
    ry = round(y)

    return rx, ry


# ----------------------------
# mouse lock logic
# ----------------------------

def mouse_window_lock(window_id, is_active):
    if not is_active:
        # print("False")
        return

    mx, my = get_mouse()
    wx, wy, ww, wh = get_window_geometry(window_id)

    # left boundary
    if mx < wx:
        subprocess.run(["xdotool", "mousemove", str(wx), str(my)])
        return

    # right boundary
    if mx > wx + ww:
        subprocess.run(["xdotool", "mousemove", str(wx + ww), str(my)])
        return

    # right boundary (extra clamp like your bash duplicate rule)
    if mx > wx + ww:
        subprocess.run(["xdotool", "mousemove", str(wx + ww - 5), str(my)])
        return

    # top boundary
    if my < wy:
        subprocess.run(["xdotool", "mousemove", str(mx), str(wy)])
        return

    # bottom boundary
    if my > wy + wh:
        subprocess.run(["xdotool", "mousemove", str(mx), str(wy + wh - 5)])
        return


def on_press(key):
    window_id = get_active_window()
    window_name = get_window_name(window_id)

    IS_WINDOW_ACTIVE = (window_name == TARGET_WINDOW_NAME)

    try:
        if key:
            print(key)

        if key == keyboard.Key.esc:
            print("Escape pressed! Exiting...")
            running = False
            return False  # Stops the listener
        
        if IS_WINDOW_ACTIVE:
            # Check if the pressed key is 'a'
            if key.char == 'q':
                # Send 'b' key
                controller.press('b')
                controller.release('b') 


    except AttributeError:
        # Handle special keys (e.g., Ctrl, Alt, Shift)
        pass

listener = keyboard.Listener(on_press=on_press, suppress=True)
listener.start()

# ----------------------------
# main loop
# ----------------------------

while running:
    window_id = get_active_window()
    window_name = get_window_name(window_id)

    IS_WINDOW_ACTIVE = (window_name == TARGET_WINDOW_NAME)

    mouse_window_lock(window_id, IS_WINDOW_ACTIVE)

    time.sleep(0.01)

    if running == False:
        break

