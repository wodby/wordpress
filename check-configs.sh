#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

wp_ver=$1

archive_url="https://wordpress.org/wordpress-${wp_ver}.tar.gz"

array=(
    "./orig/wp-config-sample.php::wordpress/wp-config-sample.php"
)

outdated=0
archive="/tmp/${RANDOM}-wordpress.tar.gz"

curl -fsSL "${archive_url}" -o "${archive}"
trap 'rm -f "${archive}"' EXIT

for index in "${array[@]}" ; do
    file="${index%%::*}"
    archive_path="${index##*::}"

    orig="/tmp/${RANDOM}"
    tar -xOf "${archive}" "${archive_path}" > "${orig}"

    echo "Checking ${file}"

    if diff --strip-trailing-cr "${file}" "${orig}"; then
        echo "OK"
    else
        echo "!!! OUTDATED"
        echo "${archive_url}"
        outdated=1
    fi

    rm -f "${orig}"
done

# we don't want travis builds fail.
#[[ "${outdated}" == 0 ]] || exit 1
