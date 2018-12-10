#FROM resin/raspberrypi3-debian:stretch
FROM resin/rpi-raspbian:stretch

RUN [ "cross-build-start" ]

#WORKDIR /app
ADD ./test_image1.jpg .
ADD ./test_image2.jpg .

RUN apt-get update &&  apt-get install -y  --no-install-recommends\
        python3 \
        python3-pip \
        build-essential \
        libboost-python1.62.0 \
        python3-picamera \
        python3-dev && \
        rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

COPY . .

RUN useradd -ms /bin/bash moduleuser
#adding the user to the video group
RUN sudo usermod -a -G video moduleuser
#create a folder where moduleuser can write to
RUN mkdir /camframes
RUN chmod 777 /camframes
USER moduleuser

ENTRYPOINT [ "python3", "-u", "./main.py" ]