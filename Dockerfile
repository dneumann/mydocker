FROM openjdk:8-jdk

RUN apt-get update && apt-get install -y \
	man \
	less \
	git \
	maven \
	vim-nox \
	bzip2 \
    ack-grep \
	sudo

ENV GRADLE_HOME /opt/gradle
ENV GRADLE_VERSION 4.2.1

ARG GRADLE_DOWNLOAD_SHA256=b551cc04f2ca51c78dd14edb060621f0e5439bdfafa6fd167032a09ac708fbc0
RUN set -o errexit -o nounset \
	&& echo "Downloading Gradle" \
	&& wget --no-verbose --output-document=gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
	\
	&& echo "Checking download hash" \
	&& echo "${GRADLE_DOWNLOAD_SHA256} *gradle.zip" | sha256sum --check - \
	\
	&& echo "Installing Gradle" \
	&& unzip gradle.zip \
	&& rm gradle.zip \
	&& mv "gradle-${GRADLE_VERSION}" "${GRADLE_HOME}/" \
    && ln --symbolic "${GRADLE_HOME}/bin/gradle" /usr/bin/gradle

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

CMD ["bash"]
