# Stage 1: Building the Python environment
FROM python:3.9 AS builder

WORKDIR /usr/app/src

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir git+https://github.com/JonasLindberg-Sigma/volvo_anpr.git && \
    pip install --no-cache-dir git+https://github.com/JonasLindberg-Sigma/truckCapturer && \
    pip install --no-cache-dir -r requirements.txt

# Install OpenCV specific dependencies
RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6 && \
    apt-get install -y xvfb # Install X Virtual Frame Buffer

# Stage 2: Creating the final image
FROM python:3.9-slim

WORKDIR /usr/app/src

# Copy only the necessary files from the previous stage
COPY --from=builder /usr/local /usr/local
COPY --from=builder /usr/app/src/ /usr/app/src/

# Copy application files
COPY main.py ./
COPY config.py ./
COPY best.pt ./

CMD [ "python", "-u", "./main.py"]
