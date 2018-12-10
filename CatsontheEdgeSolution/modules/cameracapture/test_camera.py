'''import time
import picamera
import numpy as np
import cv2

res = (640,480,3)
camera = picamera.PiCamera()
camera.resolution = res[:2]
camera.framerate = 24
time.sleep(2)
frame = np.empty((res[0] * res[1] * res[2]), dtype=np.uint8)
camera.capture(frame, 'bgr')
frame = frame.reshape(res)'''

## test it on your Raspberry. 
# Note that if the cameracapture module is running 
# you will receive a MMAL error,
# this is because the camera is already in use, 
# so stop the cameracapture module before running this code
from time import sleep
from picamera import PiCamera

res = (640,480)
camera = PiCamera()
camera.resolution = res
# Camera warm-up time
sleep(2)
camera.capture('foo.jpg')
