FROM ubuntu:14.04
MAINTAINER Marvin Winkler <marvambass@gmail.com>

ENV DISPLAY :0
ENV LANG C.UTF-8

# make sure the package repository is up to date
RUN apt-get update && apt-get install -y \
    wget \
    handbrake \
    vlc

RUN echo "deb http://download.videolan.org/pub/debian/stable/ /" > /etc/apt/sources.list.d/vlc-libdvdcss.list
RUN echo "deb-src http://download.videolan.org/pub/debian/stable/ /" >> /etc/apt/sources.list.d/vlc-libdvdcss.list
RUN wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -

RUN apt-get update && apt-get install -y \
    libdvdcss2

RUN mkdir /rips

# Autostart bash and the app (might not be the best way, but it does the trick)
CMD chmod 777 -R /rips; handbrake; chmod 777 -R /rips
