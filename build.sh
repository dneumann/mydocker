#!/bin/bash

image=`head -1 docker-names.txt`
container=`tail -1 docker-names.txt`

docker rm $container 
docker rmi $image
docker build -t $image .
