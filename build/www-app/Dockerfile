ARG build_label
FROM markussitzmann/appdock_app:$build_label
MAINTAINER markussitzmann@gmail.com

COPY . /home/www-app/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /home/www-app/nginx.conf /etc/nginx/sites-enabled/
RUN ln -s /home/www-app/supervisord.conf /etc/supervisor/conf.d/


ENV PATH /opt/conda/bin:$PATH

COPY requirements.txt /

RUN /bin/bash -c "source activate appdock" && \
    pip install -r /requirements.txt


#COPY docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
CMD ["/home/www-app/run.sh"]