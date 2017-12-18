ARG build_label
FROM markussitzmann/appdock_rdkit:$build_label
MAINTAINER markussitzmann@gmail.com

RUN conda create --verbose --yes --use-local -n appdock rdkit

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]