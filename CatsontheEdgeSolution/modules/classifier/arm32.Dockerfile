FROM resin/rpi-raspbian:stretch

RUN [ "cross-build-start" ]

ADD app /app

RUN apt-get update &&  apt-get install -y  --no-install-recommends\
        python3 \
        python3-pip \
        build-essential \
        python3-dev \
        libopenjp2-7-dev \
        libtiff5-dev \
        zlib1g-dev \
        libjpeg-dev \
        libatlas-base-dev \
        wget && \
        rm -rf /var/lib/apt/lists/*



RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install -r /app/requirements.txt

# Expose the port
EXPOSE 80


# Set the working directory
WORKDIR /app


# Run the flask server for the endpoints
#CMD python app.py
ENTRYPOINT [ "python3", "-u", "app.py" ]
