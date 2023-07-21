# Docker Laravel Nuxt

[![Software License][ico-license]](LICENSE.md)

This is a simple example for running a docker container with PHP-FPM and NGINX and NUXT in single container.
You can change version of nginx, php and node in Dockerfile:

```
ARG NODE_VERSION=16.14.0
ARG NGINX_PHP_FPM_VERSION=3.1.6
```

NGINX_PHP_FPM_VERSION is version of [richarvey/nginx-php-fpm](https://hub.docker.com/r/richarvey/nginx-php-fpm) and NODE_VERSION is version of [node repository](https://hub.docker.com/_/node/) 

For active supervisor, uncomment this line in Dockerfile and write what you want in `config/laravel-worker.conf` :
```
# COPY config/laravel-worker.conf /etc/supervisor/conf.d/laravel-worker.conf
```

If you want to add cronjob, you can uncomment this two line in `config/script.sh` and write your cronjob :
```
# echo "* * * * * php /var/www/html/cron.php > /dev/null 2>&1" >> /etc/crontabs/root
# crond -l 2 -f > /dev/stdout 2> /dev/stderr &
```

Build and running docker container: 
```
docker build -t ali00h/laravel-nuxt:v4 .
docker run -d -p 18094:8080 --name laravelnuxt1 ali00h/laravel-nuxt:v4
```
