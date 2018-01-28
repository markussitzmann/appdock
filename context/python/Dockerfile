ARG build_label
FROM markussitzmann/appdock_base:$build_label
MAINTAINER markussitzmann@gmail.com

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.30-Linux-x86_64.sh && \
    /bin/bash /Miniconda3-4.3.30-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-4.3.30-Linux-x86_64.sh

ENV PATH /opt/conda/bin:$PATH

RUN CONDA_PY=36 conda install anaconda-client --yes




