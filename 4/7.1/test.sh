#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
  set -x
fi

make start
docker exec --user=82 "${NAME}" wp core version | grep -q '4.*'
make clean