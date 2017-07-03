FROM wodby/wordpress-php:7.0-2.2.0

RUN mv /usr/local/bin/actions.mk /usr/local/bin/wordpress-php.mk && \
    mkdir -p /usr/src/wordpress && \
	chown -R www-data:www-data /usr/src/wordpress && \
	su-exec www-data wp core download --path=/usr/src/wordpress

COPY init /docker-entrypoint-init.d/
COPY actions /usr/local/bin/