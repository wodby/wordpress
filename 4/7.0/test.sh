#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

cid="$(
	docker run -d -e WP_VERSION=4 --name "${NAME}" "${IMAGE}"
)"
trap "docker rm -vf ${cid} > /dev/null" EXIT

docker exec --user=82 "${NAME}" make init -f /usr/local/bin/actions.mk
echo -n "Checking WordPress version... "
docker exec --user=82 "${NAME}" wp core version | grep -q '4.*'
echo "OK"
