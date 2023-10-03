FROM python:latest

WORKDIR /usr/app/src

COPY main.py ./

CMD [ "python", "./hellow_world.py"]