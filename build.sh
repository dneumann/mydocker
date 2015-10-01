#!/bin/bash

docker rm mydocker
docker rmi mydocker_image
docker build -t mydocker_image .
