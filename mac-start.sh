#!/bin/bash

docker rm mydocker

docker run -v /Users/dn/mydocker:/home/dennis -it --privileged --name mydocker mydocker_image

