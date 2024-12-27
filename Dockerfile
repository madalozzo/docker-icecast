FROM ubuntu:24.04
LABEL name="ubuntu2404-icecast2-nonroot"
LABEL maintener="Saulo Madalozzo <saulo.zz@gmail.com>"

# Install icecast2
RUN apt-get update && apt-get upgrade -y && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y \
 icecast2 &&\
 apt-get clean &&\
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd user --uid 1002 --create-home --shell /bin/bash
RUN usermod -a -G icecast user
USER user

ENTRYPOINT ["icecast2", "-c", "/etc/icecast2/icecast.xml"]