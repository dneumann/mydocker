#!/bin/bash

image=`head -1 docker-names.txt`
container=`tail -1 docker-names.txt`

docker rm $container

docker run -v /Users/dn/mydocker:/home/dennis -p 4200:4200 -it --privileged --name $container $image

