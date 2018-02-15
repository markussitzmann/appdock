ARG build_label
FROM markussitzmann/appdock_django:$build_label
MAINTAINER markussitzmann@gmail.com

RUN apt-get update && apt-get -y --no-install-recommends install \
    nginx \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

#ENV PATH /opt/conda/bin:$PATH


#RUN mkdir -p /opt/django
COPY ./nginx /home/nginx/
#COPY ./project_template /opt/django/project_template/
#COPY ./scripts /opt/django/scripts/
#COPY ./docker-compose.yml /
#COPY ./.env /env
#COPY docker-entrypoint.sh /

#COPY requirements.txt /

#RUN /bin/bash -c "source activate appdock" && \
#    pip install -r /requirements.txt

RUN chown -R www-data.www-data /home/nginx && \
    echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm /etc/nginx/sites-enabled/default && \
    ln -s /home/nginx/nginx.conf /etc/nginx/sites-enabled/ && \
    ln -s /home/nginx/supervisord.conf /etc/supervisor/conf.d/

EXPOSE 80
CMD ["/home/nginx/run.sh"]