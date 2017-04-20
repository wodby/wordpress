FROM wodby/wordpress-php:7.1

RUN mkdir -p /usr/src/wordpress && \
	chown -R www-data:www-data /usr/src/wordpress && \
	su-exec www-data wp core download --path=/usr/src/wordpress

COPY init /docker-entrypoint-init.d/