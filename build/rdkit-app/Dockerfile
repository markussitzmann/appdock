ARG build_label
FROM markussitzmann/appdock_python:$build_label as rdkit-build
MAINTAINER markussitzmann@gmail.com

RUN apt-get -y --no-install-recommends install \
    build-essential \
    postgresql-client \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    libcairo2-dev \
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
    cmake \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/rdkit
WORKDIR /home/rdkit

RUN git clone https://github.com/rdkit/conda-rdkit.git
WORKDIR conda-rdkit
RUN git checkout development

ENV PATH /opt/conda/bin:$PATH

RUN CONDA_PY=36 conda install jinja2 conda-build --yes && \
    CONDA_PY=36 conda build boost --quiet --no-anaconda-upload && \
    CONDA_PY=36 conda build nox --quiet --no-anaconda-upload && \
    CONDA_PY=36 conda build cairo_nox --quiet --no-anaconda-upload && \
    CONDA_PY=36 conda build cairocffi --quiet --no-anaconda-upload && \
    CONDA_PY=36 conda build eigen --quiet --no-anaconda-upload && \
    CONDA_PY=36 CONDA_NPY=112 conda build rdkit --quiet --no-anaconda-upload



FROM markussitzmann/appdock_python:$build_label
MAINTAINER markussitzmann@gmail.com

ENV PATH /opt/conda/bin:$PATH

RUN apt-get -y --no-install-recommends install \
    postgresql-client \
    libcairo2 \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
	flex \
	bison \
    libfreetype6 \
    && rm -rf /var/lib/apt/lists/*

RUN CONDA_PY=36 conda create --verbose --yes  -n appdock

COPY --from=rdkit-build /opt/conda/conda-bld/linux-64/*.tar.bz2 /home/appdock/

COPY requirements.txt /

RUN /bin/bash -c "source activate appdock" && \
    conda install numpy && \
    conda install --offline /home/appdock/boost-*.tar.bz2  && \
    conda install --offline /home/appdock/cairo-*.tar.bz2 && \
    conda install --offline /home/appdock/cairocffi-*.tar.bz2 && \
    conda install --offline /home/appdock/eigen-*.tar.bz2  && \
    conda install --offline /home/appdock/nox-*.tar.bz2  && \
    conda install --offline /home/appdock/rdkit-*.tar.bz2 && \
    conda clean -pt && \
    pip install -r /requirements.txt


COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]