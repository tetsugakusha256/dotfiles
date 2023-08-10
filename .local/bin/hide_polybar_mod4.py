import os
import time
from pynput.keyboard import Key, Listener

locked = False
time_pressed = 0
last_pressed_time = time.time()
time_threshold = 0.3
# hide when login in
os.system('xdotool search --class Polybar windowunmap %@')


def on_press(key):
    global locked, time_pressed, last_pressed_time
    if key == Key.cmd:
        if not locked:
            os.system(
                'xdotool search --class Polybar windowmap %@ windowraise %@')
        if last_pressed_time + time_threshold > time.time():
            time_pressed += 1
            if time_pressed >= 3:
                locked = not locked
        else:
            time_pressed = 1
    last_pressed_time = time.time()


def on_release(key):
    global locked, time_pressed
    if key == Key.cmd:
        if not locked:
            os.system('xdotool search --class Polybar windowunmap %@')
        else:
            if last_pressed_time + time_threshold < time.time():
                time_pressed = 0


with Listener(
        on_press=on_press,
        on_release=on_release) as listener:
    listener.join()
