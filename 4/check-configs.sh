#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

wp_ver=$1

url="https://raw.githubusercontent.com/WordPress/WordPress/${wp_ver}/wp-config-sample.php"

array=(
    "./orig/wp-config-sample.php::${url}"
)

outdated=0

for index in "${array[@]}" ; do
    local="${index%%::*}"
    url="${index##*::}"

    orig="/tmp/${RANDOM}"
    wget -qO "${orig}" "${url}"

    echo "Checking ${local}"

    if diff --strip-trailing-cr "${local}" "${orig}"; then
        echo "OK"
    else
        echo "!!! OUTDATED"
        echo "${url}"
        outdated=1
    fi

    rm -f "${orig}"
done

[[ "${outdated}" == 0 ]] || exit 1
