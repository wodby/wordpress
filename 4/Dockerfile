ARG BASE_IMAGE_TAG

FROM wodby/wordpress-php:${BASE_IMAGE_TAG}

ARG WP_VER

ENV WP_VER="${WP_VER}"

USER root

RUN set -ex; \
    \
    mv /usr/local/bin/actions.mk /usr/local/bin/wordpress-php.mk; \
    mkdir -p /usr/src/wordpress; \
	chown -R wodby:wodby /usr/src/wordpress; \
	su-exec wodby wp core download --version="${WP_VER}" --path=/usr/src/wordpress; \
	su-exec wodby mkdir -p /usr/src/wordpress/wp-content/uploads; \
	\
	chown :www-data \
        /usr/src/wordpress/wp-content/ \
        /usr/src/wordpress/wp-content/uploads \
        /usr/src/wordpress/wp-content/plugins \
        /usr/src/wordpress/wp-content/themes; \
    \
	chmod 775 \
	    /usr/src/wordpress/wp-content/ \
	    /usr/src/wordpress/wp-content/uploads \
	    /usr/src/wordpress/wp-content/plugins \
	    /usr/src/wordpress/wp-content/themes; \
	\
    if [[ -z "${PHP_DEV}" ]]; then \
	    echo "$(cat /etc/sudoers.d/wodby), /usr/local/bin/init" > /etc/sudoers.d/wodby; \
	fi

USER wodby

COPY init /docker-entrypoint-init.d/
COPY actions /usr/local/bin/