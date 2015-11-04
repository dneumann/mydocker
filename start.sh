#!/bin/bash

image=`head -1 docker-names.txt`
container=`tail -1 docker-names.txt`

docker rm $container

if [ "$1" = "-dotfiles" ]; then
	docker run -v /home/dennis --name $container $image
	docker inspect $container | grep volumes
	# sudo xterm &
	# sudo gnome-terminal &
	# cp /.../* .
	# chown dennis ...
	# chgrp dennis ...
	
else
	docker run -v /home/dennis/mydocker:/home/dennis -p 4200:4200 -it --privileged --name $container $image
fi

