#!/bin/bash

# By default the user inside the container will have the same uid/gid as the
# host user that executes this script. To override these values edit the
# variables below.
_UID=`id -u`
_GID=`id -g`

docker build -t anaconda-py3:latest --build-arg uid=$_UID --build-arg gid=$_GID .