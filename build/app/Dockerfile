ARG build_label
FROM markussitzmann/appdock_rdkit:$build_label
MAINTAINER markussitzmann@gmail.com

RUN conda create \
    --verbose --yes --use-local --channel rdkit -n appdock \
    boost \
    nox \
    cairocffi \
    eigen \
    rdkit

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]