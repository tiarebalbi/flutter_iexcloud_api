FROM debian:stretch

RUN apt-get update && apt-get -y install git curl unzip

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /home/vscodespace
WORKDIR /home/vscodespace

ENV PUB_CACHE=/home/vscodespace/.pub_cache
ENV PATH="/home/vscodespace/flutter/bin:$PATH"

RUN git clone https://github.com/flutter/flutter --branch beta && \
    /home/vscodespace/flutter/bin/flutter config --enable-web

RUN dart pub global activate pana
RUN dart pub global activate pub_release
RUN dart pub global activate dartdoc