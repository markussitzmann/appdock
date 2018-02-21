ARG build_label
FROM markussitzmann/appdock_rdkit:$build_label
MAINTAINER markussitzmann@gmail.com

ENV PATH /opt/conda/bin:$PATH

RUN mkdir -p /opt/django

COPY ./.env /opt/django/env
COPY . /opt/django

COPY docker-entrypoint.sh /
COPY requirements.txt /

RUN /bin/bash -c "source activate appdock" && \
    pip install -r /requirements.txt
