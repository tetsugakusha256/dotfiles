import os
from pynput.keyboard import Key, Listener

# hide when login in
os.system('xdotool search --class Polybar windowunmap %@')
def on_press(key):
    if key == Key.cmd:
        os.system('xdotool search --class Polybar windowmap %@ windowraise %@')

def on_release(key):
    if key == Key.cmd:
        os.system('xdotool search --class Polybar windowunmap %@')

with Listener(
        on_press=on_press,
        on_release=on_release) as listener:
    listener.join()
