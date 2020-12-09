# Vanilla WordPress Docker Container Image

[![Build Status](https://github.com/wodby/wordpress/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/wordpress/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/wordpress.svg)](https://hub.docker.com/r/wodby/wordpress)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/wordpress.svg)](https://hub.docker.com/r/wodby/wordpress)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/wordpress.svg)](https://microbadger.com/images/wodby/wordpress)

## Docker Images

❗For better reliability we release images with stability tags (`wodby/wordpress:5-X.X.X`) which correspond to [git tags](https://github.com/wodby/wordpress/releases). We strongly recommend using images only with stability tags. 

Overview:

- All images based on Alpine Linux
- Base image: [wodby/wordpress-php](https://github.com/wodby/wordpress-php)
- [GitHub actions builds](https://github.com/wodby/wordpress/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/wordpress)

[_(Dockerfile)_]: https://github.com/wodby/wordpress/tree/master/4/Dockerfile

| Supported tags and respective `Dockerfile` links | WordPress | PHP |
| ------------------------------------------------ | --------- | --- |
| `5-8.0`, `5-8`, `5`, `latest` [_(Dockerfile)_]   | 5         | 8.0 |
| `5-7.4`, `5-7`                [_(Dockerfile)_]   | 5         | 7.4 |
| `5-7.3` [_(Dockerfile)_]                         | 5         | 7.3 |
| `5-7.2` [_(Dockerfile)_]                         | 5         | 7.2 |

## Environment Variables

See [wodby/wordpress-php](https://github.com/wodby/wordpress-php) for all variables.

## Orchestration Actions

See [wodby/wordpress-php](https://github.com/wodby/wordpress-php) for all actions.

## Complete WordPress Stack

See [Docker4WordPress](https://github.com/wodby/docker4wordpress).