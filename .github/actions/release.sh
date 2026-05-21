#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if [[ ! "${WORDPRESS_VER}" =~ ^([0-9]+)\.([0-9]+)(\.([0-9]+))?$ ]]; then
  echo "Unsupported stable WORDPRESS_VER format: ${WORDPRESS_VER}" >&2
  exit 1
fi

major_tag="${BASH_REMATCH[1]}"
minor_tag="${BASH_REMATCH[1]}.${BASH_REMATCH[2]}"

if [[ "${GITHUB_REF}" == refs/heads/master || "${GITHUB_REF}" == refs/tags/* ]]; then
  # e.g. wp version 7.0.1 and php 8.5
  # 7.0-8.5
  tags=("${minor_tag}-${PHP_VER}")

  # 7.0
  if [[ -n "${LATEST_PHP}" ]]; then
    tags+=("${minor_tag}")
  fi

  if [[ -n "${LATEST_MAJOR}" ]]; then
    # 7-8.5
    tags+=("${major_tag}-${PHP_VER}")
    if [[ -n "${LATEST_PHP}" ]]; then
      # 7
      tags+=("${major_tag}")
    fi
  fi

  if [[ -n "${LATEST_MAJOR_PHP}" ]]; then
    # 7.0-8
    tags+=("${minor_tag}-${PHP_VER%.*}")
    if [[ -n "${LATEST_MAJOR}" ]]; then
      # 7-8
      tags+=("${major_tag}-${PHP_VER%.*}")
    fi
  fi

  if [[ "${GITHUB_REF}" == refs/tags/* ]]; then
    # e.g. tag 1.2.3
    stability_tag="${GITHUB_REF##*/}"
    # 7.0-8.5-1.2.3
    tags=("${minor_tag}-${PHP_VER}-${stability_tag}")
    if [[ -n "${LATEST_MAJOR}" ]]; then
      # 7-8.5-1.2.3
      tags+=("${major_tag}-${PHP_VER}-${stability_tag}")
    fi
    if [[ -n "${LATEST_MAJOR_PHP}" ]]; then
      # 7.0-8-1.2.3
      tags+=("${minor_tag}-${PHP_VER%.*}-${stability_tag}")
      if [[ -n "${LATEST_MAJOR}" ]]; then
        # 7-8-1.2.3
        tags+=("${major_tag}-${PHP_VER%.*}-${stability_tag}")
      fi
    fi
    if [[ -n "${LATEST_PHP}" ]]; then
      # 7.0-1.2.3
      tags+=("${minor_tag}-${stability_tag}")
      if [[ -n "${LATEST_MAJOR}" ]]; then
        # 7-1.2.3
        tags+=("${major_tag}-${stability_tag}")
      fi
    fi
  else
    if [[ -n "${LATEST}" ]]; then
      tags+=("latest")
    fi
  fi

  for tag in "${tags[@]}"; do
    make buildx-imagetools-create IMAGETOOLS_TAG=${tag}
  done
fi
