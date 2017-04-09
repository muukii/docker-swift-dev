FROM swift:3.1.0

MAINTAINER Muukii <m@muukii.me>

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV ON_DOCKER YES

RUN sudo apt-get update -y && apt-get dist-upgrade -fy
RUN apt-get install -y \
	git \
	wget \
	curl \
	zsh \
	vim \
	tmux
    
RUN git clone https://github.com/muukii/env.dotfiles.git /env.dotfiles
WORKDIR /env.dotfiles
RUN make

# Define default command.
CMD ["/bin/zsh"]

