#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

cid="$(
	docker run -d -e WP_VERSION=4 "${IMAGE}"
)"
trap "docker rm -vf ${cid} > /dev/null" EXIT

docker exec "${cid}" make init -f /usr/local/bin/actions.mk
echo -n "Checking WordPress version... "
docker exec "${cid}" wp core version | grep -q "${WORDPRESS_VER}"
echo "OK"
