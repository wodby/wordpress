ARG BASE_IMAGE_TAG

FROM wodby/wordpress-php:${BASE_IMAGE_TAG}

USER root

RUN set -ex; \
    \
    mv /usr/local/bin/actions.mk /usr/local/bin/wordpress-php.mk; \
    mkdir -p /usr/src/wordpress; \
	chown -R wodby:wodby /usr/src/wordpress; \
	su-exec wodby wp core download --path=/usr/src/wordpress; \
	su-exec wodby cp /usr/src/wordpress/wp-config-sample.php /usr/src/wordpress/wp-config.php; \
	su-exec wodby mkdir -p /usr/src/wordpress/wp-content/uploads; \
	chmod 775 \
	    /usr/src/wordpress/wp-config.php \
	    /usr/src/wordpress/wp-content/ \
	    /usr/src/wordpress/wp-content/uploads \
	    /usr/src/wordpress/wp-content/plugins \
	    /usr/src/wordpress/wp-content/themes; \
	\
	echo "$(cat /etc/sudoers.d/wodby), /usr/local/bin/init.sh" > /etc/sudoers.d/wodby

USER wodby

COPY init /docker-entrypoint-init.d/
COPY actions /usr/local/bin/