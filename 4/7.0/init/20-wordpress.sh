#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if [[ "${DOCROOT_SUBDIR}" == "" ]]; then
	WP_ROOT="${APP_ROOT}"
else
	WP_ROOT="${APP_ROOT}/${DOCROOT_SUBDIR}"
fi

if ! [[ -e "${WP_ROOT}/index.php" ]]; then
    echo >&2 "WordPress not found in $PWD - copying now..."
    chown -R www-data:www-data "${WP_ROOT}"
    rsync -roglt "/usr/src/wordpress/" "${WP_ROOT}/"
    echo >&2 "Complete! WordPress has been successfully copied to $PWD"

    if [[ -n "${DB_NAME}" && -n "${DB_USER}" && -n "${DB_PASSWORD}" && -n "${DB_HOST}" ]]; then
        wp core --path="${WP_ROOT}" config \
            --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="${DB_HOST}"
    fi
fi
