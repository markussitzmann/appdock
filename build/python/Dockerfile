ARG build_label
FROM markussitzmann/appdock_core:$build_label
MAINTAINER markussitzmann@gmail.com

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.30-Linux-x86_64.sh && \
    /bin/bash /Miniconda3-4.3.30-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-4.3.30-Linux-x86_64.sh

ENV PATH /opt/conda/bin:$PATH

RUN conda install jinja2 conda-build --yes
RUN conda install anaconda-client --yes
RUN conda install patchelf --yes
RUN conda install numpy=1.12 --yes
RUN conda install eigen --yes
RUN conda install python=3.6.1 --yes

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

COPY requirements.txt /
RUN CONDA_PY=36 pip install -r /requirements.txt



