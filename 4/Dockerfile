ARG FROM_TAG

FROM wodby/wordpress-php:${FROM_TAG}

USER root

RUN set -ex && \
    mv /usr/local/bin/actions.mk /usr/local/bin/wordpress-php.mk && \
    mkdir -p /usr/src/wordpress && \
	chown -R www-data:www-data /usr/src/wordpress && \
	su-exec www-data wp core download --path=/usr/src/wordpress

USER www-data

COPY init /docker-entrypoint-init.d/
COPY actions /usr/local/bin/