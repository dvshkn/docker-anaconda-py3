#!/bin/bash

if [ ! -f ./config ]; then
    echo 'config file is missing'
    exit 1
fi
source ./config

IMAGE_TAG=anaconda-py3:latest

_UID=`id -u`
_GID=`id -g`

docker create -v $DATA_DIR:/home/user/data -u $_UID:$_GID -p 127.0.0.1:$HOST_PORT:$CONTAINER_PORT -it --name $CONTAINER_NAME $IMAGE_TAG