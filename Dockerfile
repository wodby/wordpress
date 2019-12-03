ARG BASE_IMAGE_TAG

FROM wodby/wordpress-php:${BASE_IMAGE_TAG}

ARG WORDPRESS_VER

ENV WP_VER="${WORDPRESS_VER}" \
    APP_NAME="WordPress 5"

USER root

RUN set -ex; \
    \
    mv /usr/local/bin/actions.mk /usr/local/bin/wordpress-php.mk; \
    mkdir -p /usr/src/wordpress/; \
	chown -R wodby:wodby /usr/src/wordpress/; \
	\
	cd /tmp; \
	wget -O wp.tar.gz "https://wordpress.org/wordpress-${WORDPRESS_VER}.tar.gz"; \
    su-exec wodby tar zxf /tmp/wp.tar.gz --no-same-owner --strip-components=1 -C /usr/src/wordpress; \
    rm -rf /tmp/wp.tar.gz; \
    \
    cd /usr/src/wordpress; \
	su-exec wodby mkdir -p wp-content/uploads; \
	\
	chown :www-data \
        wp-content/ \
        wp-content/uploads \
        wp-content/plugins \
        wp-content/themes; \
    \
	chmod 775 \
	    wp-content/ \
	    wp-content/uploads \
	    wp-content/plugins \
	    wp-content/themes; \
	\
	find wp-content/plugins -type d -exec chown -R :www-data {} \; -exec chmod -R 775 {} \;; \
	find wp-content/themes -type d -exec chown -R :www-data {} \; -exec chmod -R 775 {} \;; \
	\
    if [[ -z "${PHP_DEV}" ]]; then \
	    echo "$(cat /etc/sudoers.d/wodby), /usr/local/bin/init" > /etc/sudoers.d/wodby; \
	fi

USER wodby

COPY init /docker-entrypoint-init.d/
COPY bin /usr/local/bin/