ARG NODE_VERSION=16.14.0
ARG NGINX_PHP_FPM_VERSION=3.1.6

FROM node:${NODE_VERSION}-alpine AS node

FROM richarvey/nginx-php-fpm:${NGINX_PHP_FPM_VERSION}

LABEL maintainer="Ali00h"

# RUN apk add --no-cache supervisor
# RUN apk add --update nodejs

ARG DOCKER_TAG
ENV APP_VERSION=$DOCKER_TAG

# Install Node
COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin
RUN node -v
RUN npm install -g yarn --force
RUN yarn -v
# End install Node

# Start Config Nginx
COPY config/nginx.conf /etc/nginx/sites-enabled/default.conf
# End Config Nginx

# Change startup script
COPY config/custom_script.sh /var/www/html/scripts/custom_script.sh
RUN chmod +x /var/www/html/scripts/custom_script.sh
# End change startup script

# Install And Run Laravel
# COPY config/laravel-worker.conf /etc/supervisor/conf.d/laravel-worker.conf
WORKDIR /var/www/html
RUN rm -rf /var/www/html
COPY ./my-laravel /var/www/html
RUN composer install
# End install And Run Laravel

# Install And Run Nuxt
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app
COPY ./my-nuxt /usr/src/nuxt-app/
RUN npm install -g npm@8.1.0
RUN npm install
RUN npm run build
EXPOSE 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
ENV PATH ./node_modules/.bin/:$PATH
#CMD npm run start
# End install And Run Nuxt






