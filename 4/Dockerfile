ARG BASE_IMAGE_TAG

FROM wodby/wordpress-php:${BASE_IMAGE_TAG}

ARG WP_VER
ARG WP_SHA1
ARG WP_MD5

ENV WP_VER="${WP_VER}" \
    WP_SHA1="${WP_SHA1}" \
    WP_MD5="${WP_MD5}" \
    APP_NAME="WordPress 4"

USER root

RUN set -ex; \
    \
    mv /usr/local/bin/actions.mk /usr/local/bin/wordpress-php.mk; \
    mkdir -p /usr/src/wordpress/; \
	chown -R wodby:wodby /usr/src/wordpress/; \
	\
	cd /tmp; \
	wget -O wp.tar.gz "https://wordpress.org/wordpress-${WP_VER}.tar.gz"; \
	echo "$WP_SHA1 *wp.tar.gz" | sha1sum -c -; \
	echo "$WP_MD5 *wp.tar.gz" | md5sum -c -; \
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