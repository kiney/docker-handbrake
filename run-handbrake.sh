#!/bin/sh

XSOCK=/tmp/.X11-unix/
RIPS="$PWD/rips"

mkdir -p "$RIPS" &> /dev/null

XAUTH=/tmp/.docker_handbrake.xauth
#xauth nlist :$DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
#chmod -R 777 $XAUTH
xhost +

#-v $XAUTH:$XAUTH \
#-e XAUTHORITY=$XAUTH \

# TODO
# properly fix all the xauth stuff... and why does handbrake connect
# to X only on the second run?

sudo docker run \
-ti --rm \
-e DISPLAY=$DISPLAY \
-v $XSOCK:$XSOCK \
-v $RIPS:/rips \
-v /media/disk/share:/in:ro \
--name handbrake handbrake bash -c "handbrake || handbrake"

sleep 2
xhost -
