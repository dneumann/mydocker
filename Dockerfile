FROM java:8

RUN apt-get update && apt-get install -y \
	man \
	git \
	maven \
	vim

RUN adduser --disabled-password --gecos "" dennis

USER dennis

WORKDIR /home/dennis/
