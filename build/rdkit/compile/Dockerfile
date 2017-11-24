FROM markussitzmann/appdock_python_conda:20170701

#RUN useradd rdkit

RUN mkdir -p /home/appdock/rdkit
WORKDIR /home/appdock/rdkit

#RUN git clone https://github.com/markussitzmann/conda-rdkit.git
RUN git clone https://github.com/markussitzmann/conda-rdkit.git
WORKDIR /home/appdock/rdkit/conda-rdkit

RUN git checkout appdock

#WORKDIR /home/appdock/rdkit

#ENV PATH /opt/conda/bin:$PATH

#RUN conda update conda --yes && \
#    conda install jinja2 conda-build --yes && \
#    conda install anaconda-client --yes && \
#    conda install patchelf --yes && \
#    conda install python=3.5 --yes


RUN CONDA_PY=35 conda build boost --quiet --no-anaconda-upload && \
    CONDA_PY=35 conda build nox --quiet --no-anaconda-upload && \
    CONDA_PY=35 conda build cairo_nox --quiet --no-anaconda-upload && \
    CONDA_PY=35 conda build cairocffi --quiet --no-anaconda-upload && \
    CONDA_PY=35 conda build eigen --quiet --no-anaconda-upload && \
    CONDA_PY=35 conda build rdkit --quiet --no-anaconda-upload && \
    CONDA_PY=35 conda build ncurses --quiet --no-anaconda-upload && \
    CONDA_PY=35 conda build postgresql95 --quiet --no-anaconda-upload && \
    CONDA_PY=35 conda build rdkit-postgresql95 --quiet --no-anaconda-upload && \

    CONDA_PY=35 CONDA_NPY=110 conda build rdkit --quiet --no-anaconda-upload &&\
    CONDA_PY=35 CONDA_NPY=110 conda build rdkit --quiet --no-anaconda-upload

RUN conda create --use-local --yes --quiet --name appserver python rdkit rdkit-postgresql95 postgresql95


#COPY docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]

#EXPOSE 5432
#CMD ["postgres"]












