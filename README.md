# Docker Laravel Nuxt

This is a simple example for running a docker container with PHP-FPM, NGINX and NUXT (PM2 starting) in single container.

## Build and Test
Build and running docker container: 
```
docker build -t ali00h/laravel-nuxt:v1.0.5 .
docker-compose up
```
And for test open these links in browser:
```
http://localhost:18094/
http://localhost:18094/api/
```
First url open nuxt project that exist in my-nuxt directory and second one open laravel project that exist in my-laravel directory. You can customize `/api/` path and other ProxyPass configs in `config/nginx-proxy.conf`.



## NGINX PHP NODE Version
You can change version of nginx, php and node in Dockerfile:
```
ARG NODE_VERSION=16.14.0
ARG NGINX_PHP_FPM_VERSION=3.1.6
```

NGINX_PHP_FPM_VERSION is version of [richarvey/nginx-php-fpm](https://hub.docker.com/r/richarvey/nginx-php-fpm) and NODE_VERSION is version of [node repository](https://hub.docker.com/_/node/) 



## Supervisor
For active supervisor, uncomment this line in Dockerfile and write what you want in `config/laravel-worker.conf` :
```
# COPY config/laravel-worker.conf /etc/supervisor/conf.d/laravel-worker.conf
```

## Cronjob
If you want to add cronjob, you can uncomment this two line in `config/custom_script.sh` and write your cronjob :
```
# echo "* * * * * php /var/www/html/cron.php > /dev/null 2>&1" >> /etc/crontabs/root
# crond -l 2 -f > /dev/stdout 2> /dev/stderr &
```


