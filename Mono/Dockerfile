FROM mono
ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/container \
    USER=container
COPY entrypoint.sh /entrypoint.sh
WORKDIR ${HOME}
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends iproute2 && \
    useradd ${USER} -d ${HOME} && \
    rm -rf /var/lib/apt/lists/*
USER ${USER}
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
