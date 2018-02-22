ARG BASE_IMAGE_TAG

FROM wodby/wordpress-php:${BASE_IMAGE_TAG}

ARG WP_VER

ENV WP_VER="${WP_VER}" \
    APP_NAME="WordPress 4"

USER root

RUN set -ex; \
    \
    mv /usr/local/bin/actions.mk /usr/local/bin/wordpress-php.mk; \
    mkdir -p /usr/src/wordpress/; \
	chown -R wodby:wodby /usr/src/wordpress/; \
	cd /usr/src/wordpress/; \
	su-exec wodby wp core download --version="${WP_VER}"; \
	su-exec wodby mkdir -p wp-content/uploads; \
	\
	chown :www-data \
        wp-content/ \
        wp-content/uploads \
        wp-content/upgrade \
        wp-content/plugins \
        wp-content/themes; \
    \
	chmod 775 \
	    wp-content/ \
	    wp-content/uploads \
	    wp-content/upgrade \
	    wp-content/plugins \
	    wp-content/themes; \
	\
	find wp-content/plugins -type d -exec chown :www-data {} \; -exec chmod 775 {} \;; \
	find wp-content/themes -type d -exec chown :www-data {} \; -exec chmod 775 {} \;; \
	\
    if [[ -z "${PHP_DEV}" ]]; then \
	    echo "$(cat /etc/sudoers.d/wodby), /usr/local/bin/init" > /etc/sudoers.d/wodby; \
	fi

USER wodby

COPY init /docker-entrypoint-init.d/
COPY actions /usr/local/bin/