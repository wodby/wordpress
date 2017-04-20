#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if ! [ -e "${APP_ROOT}/index.php" -a -e "${APP_ROOT}/wp-includes/version.php" ]; then
    echo >&2 "WordPress not found in ${APP_ROOT} - copying now..."
    chown -R www-data:www-data "${APP_ROOT}"
    rsync -roglt "/usr/src/wordpress/" "${APP_ROOT}/"
    touch "${APP_ROOT}/.ready"
    echo >&2 "Complete! WordPress has been successfully copied to ${APP_ROOT}"

    if [[ -z "${WP_VERSION}" && -n "${DB_NAME}"  ]]; then
        wp core --path="${APP_ROOT}" config \
            --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="${DB_HOST}"
    fi
fi
