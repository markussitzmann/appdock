FROM debian:stretch
MAINTAINER markus.sitzmann@gmail.com

RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    curl wget gosu sudo \
    gnupg \
    unzip tar bzip2 \
    postgresql-client \
    build-essential \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    libcairo2-dev \
	nginx \
	supervisor \
	libjpeg-dev \
	libpng-dev \
	libpq-dev \
	flex \
	bison \
    libfreetype6 \
    libfreetype6-dev \
    libtiff5-dev \
    libjpeg62-turbo-dev \
    libxml2-dev \
    libxslt1-dev


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]