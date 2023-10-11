import os
os.system('Xvfb :1 -screen 0 1600x1200x16  &')    # create virtual display with size 1600x1200 and 16 bit color.
os.environ['DISPLAY']=':1.0'    # tell X clients to use our virtual DISPLAY :1.0

from truckCapturer.camera_controller import initiate


def main():
    # Initialization
    src = 'https://www.youtube.com/watch?v=IGkTMeZ8_g4'
    initiate(src)


if __name__ == "__main__":
    main()