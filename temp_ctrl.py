# import sys
# print(sys.version_info)

import pyautogui
import keyboard
# import time
# start_time = time.time()

pyautogui.FAILSAFE = False

try:
    while True:
        pyautogui.moveTo(500, 500)  # , duration=0.5)

        pyautogui.moveTo(1100, 500, duration=0.5)
        # pyautogui.click(1100, 500)

        pyautogui.moveTo(100, 500, duration=1)
        # pyautogui.click(100, 500)
except KeyboardInterrupt:
    pass
