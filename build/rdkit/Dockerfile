ARG build_label
FROM markussitzmann/appdock_python:$build_label
MAINTAINER markussitzmann@gmail.com

RUN mkdir -p /home/rdkit
WORKDIR /home/rdkit

RUN git clone https://github.com/rdkit/conda-rdkit.git
WORKDIR conda-rdkit
RUN git checkout development

ENV PATH /opt/conda/bin:$PATH

RUN CONDA_PY=36 conda build boost --quiet --no-anaconda-upload && \
    CONDA_PY=36 conda build nox --quiet --no-anaconda-upload && \
    CONDA_PY=36 conda build cairo_nox --quiet --no-anaconda-upload && \
    CONDA_PY=36 conda build cairocffi --quiet --no-anaconda-upload && \
    CONDA_PY=36 conda build eigen --quiet --no-anaconda-upload && \
    CONDA_PY=36 CONDA_NPY=112 conda build rdkit --quiet --no-anaconda-upload

WORKDIR /home/rdkit
RUN rm -rf conda-rdkit
WORKDIR /home
RUN rm -rf rdkit

RUN apt-get purge -y --auto-remove build-essential














