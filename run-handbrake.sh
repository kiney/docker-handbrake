#!/bin/sh

XSOCK=/tmp/.X11-unix/X0
RIPS="$PWD/rips"

mkdir -p "$RIPS" &> /dev/null

# disable xserver access control
xhost +

docker rm -f handbrake

docker run \
-d \
--privileged \
-v $XSOCK:$XSOCK \
-v /etc/localtime:/etc/localtime:ro \
-v /dev/sr0:/dev/sr0 \
-v /dev/cdrom:/dev/cdrom \
-v $RIPS:/rips \
--name handbrake marvambass/handbrake

sleep 1
# enable xserver access control again
xhost -
