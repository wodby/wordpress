#!/usr/bin/env bash

set -e

if [[ ! -z "${DEBUG}" ]]; then
  set -x
fi

make start
docker exec --user=82 "${NAME}" wp core version | grep '4.7.3'
make clean