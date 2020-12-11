FROM yourls:fpm-alpine

RUN apk add --no-cache nginx

COPY nginx-vhost.conf /etc/nginx/conf.d/default.conf

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ADD https://raw.githubusercontent.com/Flameborn/yourls-sqlite/master/db.php /usr/src/yourls/user/

EXPOSE 80
VOLUME ["/var/www/html"]

