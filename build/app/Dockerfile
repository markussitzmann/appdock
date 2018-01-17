ARG build_label
FROM markussitzmann/appdock_python:$build_label
MAINTAINER markussitzmann@gmail.com

ENV PATH /opt/conda/bin:$PATH

RUN apt-get -y --no-install-recommends install \
    build-essential \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN CONDA_PY=36 conda create --verbose --yes  -n appdock

COPY requirements.txt /

RUN /bin/bash -c "source activate appdock" && \
    pip install -r /requirements.txt


COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]