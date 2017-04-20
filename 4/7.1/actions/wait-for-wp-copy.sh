#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
  set -x
fi

ready=0
max_try=$1
wait_seconds=$2

for i in $(seq 1 "${max_try}"); do
    if [[ -f "${APP_ROOT}/.ready" ]]; then
        ready=1
        rm "${APP_ROOT}/.ready"
        break
    fi
    echo 'WordPress is copying...'
    sleep "${wait_seconds}"
done

if [[ "${ready}" -eq '0' ]]; then
    echo >&2 'Error. Failed to copy WordPress.'
    exit 1
fi

echo 'WordPress has been copied!'