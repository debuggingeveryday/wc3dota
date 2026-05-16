from pynput import keyboard
import subprocess

controller = keyboard.Controller()

is_injected = False
with_suppress = False

def on_press(key):
    global is_injected
    global with_suppress

    if is_injected:
        return

    try:
        if key == keyboard.Key.esc:
            print("Escape pressed! Exiting...")
            return False

        is_injected = True

        # q -> b
        if hasattr(key, 'char') and key.char == 'q':
            controller.press('b')
            controller.release('b')

        # normal chars
        elif hasattr(key, 'char') and key.char:
            controller.press(key.char)
            controller.release(key.char)

        # other special keys
        else:
            controller.press(key)
            controller.release(key)


        is_injected = False

    except AttributeError:
        is_injected = False


listener = keyboard.Listener(
    on_press=on_press,
)

listener.start()
listener.join()
