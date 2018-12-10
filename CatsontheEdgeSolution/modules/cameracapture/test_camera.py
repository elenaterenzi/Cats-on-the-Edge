## test it on your Raspberry. 
# Note that if the cameracapture module is running 
# you will receive a MMAL error.
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
