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

sudo docker run \
-ti --rm \
-e DISPLAY=$DISPLAY \
-v $XSOCK:$XSOCK \
-v $RIPS:/rips \
--name handbrake handbrake bash -c "handbrake || handbrake"

#sleep 10
#xhost -
