#!/bin/sh

XSOCK=/tmp/.X11-unix/X0
RIPS="$PWD/rips"

mkdir -p "$RIPS" &> /dev/null

XAUTH=/tmp/.docker_handbrake.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker rm -f handbrake

docker run \
-t --rm \
-e XAUTHORITY=$XAUTH \
-v $XSOCK:$XSOCK \
-v $XAUTH:$XAUTH \
-v /etc/localtime:/etc/localtime:ro \
-v $RIPS:/rips \
--name handbrake handbrake &
