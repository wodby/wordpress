#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if [[ ! -f "${APP_ROOT}/index.php" ]]; then
    echo >&2 "WordPress not found in ${APP_ROOT} - copying now..."
    rsync -rltogp "/usr/src/wordpress/" "${APP_ROOT}/"
    echo >&2 "Complete! WordPress has been successfully copied to ${APP_ROOT}"

    if [[ -z "${WODBY_APP_NAME}" ]]; then
        sed -i "s/database_name_here/${DB_NAME:-wordpress}/" "${APP_ROOT}/wp-config.php"
        sed -i "s/username_here/${DB_NAME:-wordpress}/" "${APP_ROOT}/wp-config.php"
        sed -i "s/password_here/${DB_NAME:-wordpress}/" "${APP_ROOT}/wp-config.php"
        sed -i "s/'DB_HOST', 'localhost'/'DB_HOST', '${DB_NAME:-mariadb}'/" "${APP_ROOT}/wp-config.php"
    fi
fi
