#!/bin/bash

echo "start nuxt at startup..."
cd /usr/src/nuxt-app/
pm2 start

echo "start redis..."
redis-server

# start cronjob
# echo "* * * * * php /var/www/html/cron.php > /dev/null 2>&1" >> /etc/crontabs/root
# crond -l 2 -f > /dev/stdout 2> /dev/stderr &
# end cronjob