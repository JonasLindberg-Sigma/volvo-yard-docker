FROM --platform=linux/amd64 python:3.9

WORKDIR /usr/app/src

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir git+https://github.com/JonasLindberg-Sigma/volvo_anpr.git && \
    pip install --no-cache-dir git+https://github.com/JonasLindberg-Sigma/truckCapturer && \
    pip install --no-cache-dir -r requirements.txt

# Install OpenCV specific dependencies
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get install -y xvfb # Install X Virtual Frame Buffer

COPY main.py ./
COPY config.py ./
COPY best.pt ./

CMD [ "python", "-u", "./main.py"]