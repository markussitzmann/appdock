ARG build_label
FROM markussitzmann/appdock_app:$build_label
MAINTAINER markussitzmann@gmail.com

RUN apt-get -y --no-install-recommends install \
    nginx \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

ENV PATH /opt/conda/bin:$PATH

COPY ./nginx /home/nginx
COPY ./project_template /opt/project_template

RUN chown -R www-data.www-data /home/nginx && \
    echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm /etc/nginx/sites-enabled/default && \
    ln -s /home/nginx/nginx.conf /etc/nginx/sites-enabled/ && \
    ln -s /home/nginx/supervisord.conf /etc/supervisor/conf.d/

COPY requirements.txt /

RUN /bin/bash -c "source activate appdock" && \
    pip install -r /requirements.txt

COPY docker-entrypoint.sh /

EXPOSE 80
CMD ["/home/nginx/run.sh"]