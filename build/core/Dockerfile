ARG build_label
FROM markussitzmann/appdock_base:$build_label
MAINTAINER markussitzmann@gmail.com

RUN apt-get -y --no-install-recommends install \
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
    libxslt1-dev \
    patch \
    cmake

