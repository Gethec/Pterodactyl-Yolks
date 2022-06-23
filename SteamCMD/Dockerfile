FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/container \
    USER=container
WORKDIR ${HOME}
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y \
    iproute2 locales software-properties-common unzip wget && \
    locale-gen --lang en_US.UTF-8 && \
    add-apt-repository multiverse && \
    dpkg --add-architecture i386 && \
    apt-get update && apt-get upgrade -y && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    apt-get install lib32gcc-s1 steamcmd -y && \
    ln -s /usr/games/steamcmd /bin/steamcmd && \
    useradd ${USER} -d ${HOME}
USER ${USER}

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash"]
CMD ["/entrypoint.sh"]
