FROM java:8

RUN apt-get update && apt-get install -y \
	man \
	less \
	git \
	maven \
	vim \
	cifs-utils \
	bzip2 \
	sudo

RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get update && apt-get install -y nodejs \
	&& npm install -g bower \
	&& npm install -g ember-cli \
	&& npm install -g phantomjs

RUN adduser --disabled-password --gecos "" dennis
RUN echo "dennis:x" | chpasswd
RUN usermod -a -G sudo dennis

USER dennis
RUN git config --global alias.lg "log --oneline --all --graph --decorate"
RUN git config --global alias.ss "status -s"
RUN git config --global core.pager "less"
RUN git config --global user.name "Dennis Neumann"
RUN git config --global user.email "neumann@sub.uni-goettingen.de"
RUN git config --global push.default simple
WORKDIR /home/dennis/
