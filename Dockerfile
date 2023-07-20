FROM richarvey/nginx-php-fpm:3.1.6


#RUN apk add --no-cache supervisor

ARG DOCKER_TAG
ENV APP_VERSION=$DOCKER_TAG

# COPY config/laravel-worker.conf /etc/supervisor/conf.d/laravel-worker.conf

COPY config/start.sh /start.sh
RUN chmod +x /start.sh



#CMD ["/home/entry.sh"]
#COPY ./app/ /app/
#RUN composer install