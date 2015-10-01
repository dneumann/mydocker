#!/bin/bash

docker rm mydocker

if [ "$1" = "-dotfiles" ]; then
	docker run -v /home/dennis --name mydocker mydocker_image
	docker inspect mydocker | grep /home/dennis
	# sudo xterm &
	# cp /.../* .
	# chown dennis ...
	# chgrp dennis ...
	
else
	docker run -v /home/dennis/mydocker:/home/dennis -it --name mydocker mydocker_image
fi

