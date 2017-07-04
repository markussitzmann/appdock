FROM debian:stretch
MAINTAINER markus.sitzmann@gmail.com

RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    curl wget gosu sudo \
    gnupg \
    unzip tar bzip2 \
    postgresql-client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]