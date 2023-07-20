ARG NODE_VERSION=16.14.0
ARG NGINX_PHP_FPM_VERSION=3.1.6

FROM node:${NODE_VERSION}-alpine AS node

FROM richarvey/nginx-php-fpm:${NGINX_PHP_FPM_VERSION}


# RUN apk add --no-cache supervisor
# RUN apk add --update nodejs

# Install Node
COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin
RUN node -v
RUN npm install -g yarn --force
RUN yarn -v
# End install Node

ARG DOCKER_TAG
ENV APP_VERSION=$DOCKER_TAG

# COPY config/laravel-worker.conf /etc/supervisor/conf.d/laravel-worker.conf

COPY config/start.sh /start.sh
RUN chmod +x /start.sh



#CMD ["/home/entry.sh"]
#COPY ./app/ /app/
#RUN composer install