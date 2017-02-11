FROM ubuntu:16.04
MAINTAINER Jannik Winkel <jannik dot winkel  kiney.de>

ENV DISPLAY :0
ENV LANG C.UTF-8

RUN groupadd -g 1000 handbrake
RUN useradd -u 1000 -g 1000 handbrake

# make sure the package repository is up to date
RUN apt-get update; apt-get install -y \
    wget \
    handbrake \
    scite \
    x11-apps \
    autoconf \
    automake \
    build-essential \
    cmake \
    git \
    libass-dev \
    libbz2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libjansson-dev \
    libmp3lame-dev \
    libogg-dev \
    libopus-dev \
    libsamplerate-dev \
    libtheora-dev \
    libtool \
    libvorbis-dev \
    libx264-dev \
    libxml2-dev \
    m4 \
    make \
    patch \
    pkg-config \
    python \
    tar \
    yasm \
    zlib1g-dev \
    libtool-bin \
    intltool \
    libappindicator-dev \
    libdbus-glib-1-dev \
    libglib2.0-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgtk-3-dev \
    libgudev-1.0-dev \
    libnotify-dev \
    libwebkitgtk-3.0-dev

RUN mkdir build \
    && cd build \
    && git clone https://github.com/HandBrake/HandBrake.git \
    && cd HandBrake \
    && ./configure --launch-jobs=$(nproc) --launch \
    && cd build \
    && make install

RUN rm -Rf /build

RUN mkdir /rips

#USER handbrake

CMD handbrake
