# Vanilla WordPress Docker Container Image

[![Build Status](https://github.com/wodby/wordpress/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/wordpress/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/wordpress.svg)](https://hub.docker.com/r/wodby/wordpress)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/wordpress.svg)](https://hub.docker.com/r/wodby/wordpress)

## Docker Images

❗For better reliability we release images with stability tags (`wodby/wordpress:6-X.X.X`) which correspond to [git tags](https://github.com/wodby/wordpress/releases). We strongly recommend using images only with stability tags. 

Overview:

- All images are based on Alpine Linux
- Base image: [wodby/wordpress-php](https://github.com/wodby/wordpress-php)
- [GitHub actions builds](https://github.com/wodby/wordpress/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/wordpress)

[_(Dockerfile)_]: https://github.com/wodby/wordpress/tree/master/4/Dockerfile

| Supported tags and respective `Dockerfile` links | WordPress | PHP |
|--------------------------------------------------|-----------|-----|
| `6-8.5`, `6-8`, `6`, `latest` [_(Dockerfile)_]   | 6         | 8.5 |
| `6-8.4` [_(Dockerfile)_]                         | 6         | 8.3 |
| `6-8.3` [_(Dockerfile)_]                         | 6         | 8.3 |
| `6-8.2` [_(Dockerfile)_]                         | 6         | 8.2 |
| `6-8.1` [_(Dockerfile)_]                         | 6         | 8.1 |

All images built for `linux/amd64` and `linux/arm64`

## Environment Variables

See [wodby/wordpress-php](https://github.com/wodby/wordpress-php) for all variables.

## Orchestration Actions

See [wodby/wordpress-php](https://github.com/wodby/wordpress-php) for all actions.

## Complete WordPress Stack

See [Docker4WordPress](https://github.com/wodby/docker4wordpress).