FROM markussitzmann/appdock_hull:20170701
MAINTAINER markussitzmann@gmail.com
ARG BUILD_LABEL

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash /Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH /opt/conda/bin:$PATH

RUN conda update conda --yes && \
    conda config --add channels rdkit && \
    conda install jinja2 conda-build --yes && \
    conda install anaconda-client --yes && \
    conda install patchelf --yes && \
    conda install python=3.5 --yes

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# explicitly set user/group IDs
#RUN groupadd -r appserver --gid=1000 && useradd -r -g appserver --uid=1000 appserver

COPY requirements.txt /
COPY docker-entrypoint.sh /

#RUN conda install --use-local --yes --quiet python rdkit
RUN CONDA_PY=35 pip install -r /requirements.txt

#RUN mkdir -p /opt/appserver && \
#    chown -R appserver.appserver /opt/appserver && \
#    chown -R appserver.appserver /opt/conda
#USER appserver

#ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["/bin/bash"]


