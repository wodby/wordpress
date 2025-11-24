#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if [[ "${GITHUB_REF}" == refs/heads/master || "${GITHUB_REF}" == refs/tags/* ]]; then      
  minor_ver="${WORDPRESS_VER%.*}"
  minor_tag="${minor_ver}"
  major_tag="${minor_ver%.*}"

  # e.g. wp version 6.8.3 and php 8.5
  # 6.8-8.5
  tags=("${minor_tag}-${PHP_VER}")

  # 6.8
  if [[ -n "${LATEST_PHP}" ]]; then
    tags+=("${minor_tag}")
  fi

  if [[ -n "${LATEST_MAJOR}" ]]; then
    # 6-8.5
    tags+=("${major_tag}-${PHP_VER}")
    if [[ -n "${LATEST_PHP}" ]]; then
      # 6
      tags+=("${major_tag}")
    fi
  fi

  if [[ -n "${LATEST_MAJOR_PHP}" ]]; then
    # 6.8-8
    tags+=("${minor_tag}-${PHP_VER%.*}")
    if [[ -n "${LATEST_MAJOR}" ]]; then
      # 6-8
      tags+=("${major_tag}-${PHP_VER%.*}")      
    fi
  fi

  if [[ "${GITHUB_REF}" == refs/tags/* ]]; then
    # e.g. tag 1.2.3
    stability_tag="${GITHUB_REF##*/}"
    # 6.8-8.5-1.2.3
    tags=("${minor_tag}-${PHP_VER}-${stability_tag}")
    if [[ -n "${LATEST_MAJOR}" ]]; then
      # 6-8.5-1.2.3
      tags+=("${major_tag}-${PHP_VER}-${stability_tag}")
    fi
    if [[ -n "${LATEST_MAJOR_PHP}" ]]; then
      # 6.8-8-1.2.3
      tags+=("${minor_tag}-${PHP_VER%.*}-${stability_tag}")
      if [[ -n "${LATEST_MAJOR}" ]]; then
        # 6-8-1.2.3
        tags+=("${major_tag}-${PHP_VER%.*}-${stability_tag}")
      fi
    fi
    if [[ -n "${LATEST_PHP}" ]]; then
      # 6.8-1.2.3
      tags+=("${minor_tag}-${stability_tag}")
      if [[ -n "${LATEST_MAJOR}" ]]; then
        # 6-1.2.3
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