#!/usr/bin/env bash

set -e

if [[ ! -z "${DEBUG}" ]]; then
    set -x
fi

if ! [ -e index.php -a -e wp-includes/version.php ]; then
    echo >&2 "WordPress not found in $PWD - copying now..."
    if [ "$(ls -A)" ]; then
        echo >&2 "WARNING: $PWD is not empty - press Ctrl+C now if this is an error!"
        ( set -x; ls -A; sleep 10 )
    fi
    tar cf - --one-file-system -C /usr/src/wordpress . | tar xf -
    echo >&2 "Complete! WordPress has been successfully copied to $PWD"
    if [ ! -e .htaccess ]; then
        # NOTE: The "Indexes" option is disabled in the php:apache base image
        cat > .htaccess <<-'EOF'
            # BEGIN WordPress
            <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteBase /
            RewriteRule ^index\.php$ - [L]
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteCond %{REQUEST_FILENAME} !-d
            RewriteRule . /index.php [L]
            </IfModule>
            # END WordPress
EOF
        chown www-data:www-data .htaccess
    fi
fi
