#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if ! [ -e "${APP_ROOT}/index.php" ]; then
    echo >&2 "WordPress not found in ${APP_ROOT} - copying now..."
    rsync -rlt "/usr/src/wordpress/" "${APP_ROOT}/"
    echo >&2 "Complete! WordPress has been successfully copied to ${APP_ROOT}"

    if [[ -z "${WP_VERSION}" && -n "${DB_NAME}"  ]]; then
        wp core --path="${APP_ROOT}" config \
            --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="${DB_HOST}"
    fi
fi
