#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if ! [ -e index.php -a -e wp-includes/version.php ]; then
    echo >&2 "WordPress not found in ${PWD} - copying now..."
    chown -R www-data:www-data "${PWD}"
    rsync -roglt "/usr/src/wordpress/" "${PWD}/"
    echo >&2 "Complete! WordPress has been successfully copied to $PWD"

    if [[ -z "${WP_VERSION}" && -n "${DB_NAME}"  ]]; then
        wp core config --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="${DB_HOST}"
    fi
fi
