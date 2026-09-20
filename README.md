# Vanilla WordPress Docker Container Image

[![Build Status](https://github.com/wodby/wordpress/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/wordpress/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/wordpress.svg)](https://hub.docker.com/r/wodby/wordpress)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/wordpress.svg)](https://hub.docker.com/r/wodby/wordpress)

## Docker Images

Use image revision tags such as `wodby/wordpress:7-rN` to select a Wodby image revision.
Major and minor tags use the repository release number. Full-version tags such as
`wodby/wordpress:7.1.1-r0` start at `r0` for each exact upstream version.
Every published versioned revision tag has a matching annotated Git tag pointing to its release commit.
Existing tags remain available after support for their major or minor version ends.
Initial WordPress releases named `7.2` use `7.2.0-r0` for the full-version tag.
See [release tags](https://github.com/wodby/wordpress/tags) for available revisions and the [image revision policy](https://github.com/wodby/images#image-revisions) for upgrade guidance.
Previously published image tags remain available.

Overview:

- All images are based on Alpine Linux
- Base image: [wodby/wordpress-php](https://github.com/wodby/wordpress-php)
- [GitHub actions builds](https://github.com/wodby/wordpress/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/wordpress)

[_(Dockerfile)_]: https://github.com/wodby/wordpress/tree/master/4/Dockerfile

| Supported tags and respective `Dockerfile` links | WordPress | PHP |
|--------------------------------------------------|-----------|-----|
| `7-8.5`, `7-8`, `7`, `latest` [_(Dockerfile)_]   | 7         | 8.5 |
| `7-8.4` [_(Dockerfile)_]                         | 7         | 8.4 |
| `7-8.3` [_(Dockerfile)_]                         | 7         | 8.3 |
| `7-8.2` [_(Dockerfile)_]                         | 7         | 8.2 |

All images built for `linux/amd64` and `linux/arm64`

To build or test a specific upstream WordPress release explicitly, override `WORDPRESS_VER`:

```bash
make build WORDPRESS_VER=7.0
make test WORDPRESS_VER=7.0
```

## Environment Variables

See [wodby/wordpress-php](https://github.com/wodby/wordpress-php) for all variables.

## Orchestration Actions

See [wodby/wordpress-php](https://github.com/wodby/wordpress-php) for all actions.

## Complete WordPress Stack

See [Docker4WordPress](https://github.com/wodby/docker4wordpress).

## Building with pinned base images

Build with the Makefile to use the base image digests in `base-images.mk`. Local
builds and CI resolve the same version and variant to the same multi-platform
image. A version without a pin fails before the build starts.

When adding a supported base version or variant, add its image index digest to
`base-images.mk`. For a custom build, override `BASE_IMAGE` with a complete
`repository:tag@sha256:...` reference.
