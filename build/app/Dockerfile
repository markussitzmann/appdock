ARG build_label
FROM markussitzmann/appdock_rdkit:$build_label
MAINTAINER markussitzmann@gmail.com

ENV PATH /opt/conda/bin:$PATH

RUN CONDA_PY=36 conda create \
    --verbose --yes --use-local --channel rdkit -n appdock
    #boost \
    #nox \
    #cairocffi \
    #eigen \
    #rdkit

COPY requirements.txt /

RUN /bin/bash -c "source activate appdock" && \
    pip install -r /requirements.txt && \
    conda install --use-local rdkit

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]