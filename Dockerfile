FROM ubuntu:17.10

ARG USER=dockerci
ENV USER=$USER
ARG PASS=dockerci
ENV PASS=$PASS

RUN apt-get update -qq
RUN apt-get install -qq git \
	make \
	sudo \
	ssh \
	software-properties-common \
	python \
	npm \
	nodejs \
	ruby \
	ruby-dev \
	apache2 \
	build-essential > /dev/null
RUN gem install -q jekyll bundler htmlbeautifier htmlcompressor
RUN npm install -g jshint htmlhint &> /dev/null
RUN useradd -ms /bin/bash ${USER}
RUN echo "${USER}:${PASS}" | chpasswd
RUN adduser ${USER} sudo
USER ${USER}
WORKDIR /home/${USER}/
RUN mkdir -p owasp-halifax/
RUN mkdir -p .gem/
ADD . owasp-halifax/
USER root
RUN chown -R ${USER}:${USER} owasp-halifax/
USER ${USER}
WORKDIR /home/${USER}/owasp-halifax/
RUN make
USER root
RUN make install
CMD service apache2 start && \
	service ssh start && \
	tail -f /var/log/apache2/access.log \
		 /var/log/apache2/error.log \
		 /var/log/auth.log
