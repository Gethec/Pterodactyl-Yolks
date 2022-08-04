FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/container \
    USER=container
WORKDIR ${HOME}
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        iproute2 \
        locales \
        software-properties-common \
        unzip && \
    locale-gen --lang en_US.UTF-8 && \
    add-apt-repository multiverse && \
    dpkg --add-architecture i386 && \
    apt-get update && apt-get upgrade -y && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    apt-get install -y --no-install-recommends \
        lib32gcc-s1 \
        steamcmd && \
    ln -s /usr/games/steamcmd /bin/steamcmd && \
    useradd ${USER} -d ${HOME}
