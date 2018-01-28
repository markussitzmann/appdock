FROM debian:stretch
MAINTAINER markus.sitzmann@gmail.com

RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    curl wget gosu sudo \
    gnupg \
    unzip tar bzip2 \
    git
    
COPY docker-entrypoint.sh /
COPY ./appdock /opt/appdock

ENTRYPOINT ["/docker-entrypoint.sh"]