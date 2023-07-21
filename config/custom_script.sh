#!/bin/bash

# start custom laravel-nuxt
# echo "* * * * * php /var/www/html/cron.php > /dev/null 2>&1" >> /etc/crontabs/root
# crond -l 2 -f > /dev/stdout 2> /dev/stderr &
# end custom laravel-nuxt

echo "start nuxt at startup..."
cd /usr/src/nuxt-app/
npm run start