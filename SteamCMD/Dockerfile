FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/container \
    USER=container
WORKDIR ${HOME}
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    iproute2 \
    locales \
    software-properties-common \
    unzip \
    wget && \
    locale-gen --lang en_US.UTF-8 && \
    add-apt-repository multiverse && \
    dpkg --add-architecture i386 && \
    apt-get update && apt-get upgrade -y && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    apt-get install lib32gcc-s1 steamcmd -y && \
    ln -s /usr/games/steamcmd /bin/steamcmd && \
    useradd ${USER} -d ${HOME} && \
    mkdir -p ${HOME}/.steam/{root,steam,sdk64} && \
    chown -R ${USER}:${USER} ${HOME}

USER ${USER}
RUN  steamcmd +quit && \
    ln -s ${HOME}/.local/share/Steam/steamcmd/linux64/steamclient.so ${HOME}/.steam/sdk64/steamclient.so
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]