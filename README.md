# Vanilla WordPress Docker Container Image

[![Build Status](https://travis-ci.org/wodby/wordpress.svg?branch=master)](https://travis-ci.org/wodby/wordpress)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/wordpress.svg)](https://hub.docker.com/r/wodby/wordpress)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/wordpress.svg)](https://hub.docker.com/r/wodby/wordpress)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Docker Images

* All images are based on Alpine Linux
* Base image: [wodby/wordpress-php](https://github.com/wodby/wordpress-php)
* [Travis CI builds](https://travis-ci.org/wodby/wordpress) 
* [Docker Hub](https://hub.docker.com/r/wodby/wordpress)

For better reliability we release images with stability tags (`wodby/wordpress:4-7.1-X.X.X`) which correspond to git tags. We **strongly recommend** using images only with stability tags. Below listed basic tags:

| Image tag (Dockerfile)                                                     | WordPress | PHP |
| -------------------------------------------------------------------------- | --------- | --- |
| [4-7.1](https://github.com/wodby/wordpress/tree/master/4/Dockerfile)       | 4.x       | 7.1 |
| [4-7.0](https://github.com/wodby/wordpress/tree/master/4/Dockerfile)       | 4.x       | 7.0 |
| [4-5.6](https://github.com/wodby/wordpress/tree/master/4/Dockerfile)       | 4.x       | 5.6 |
| [4-7.1-debug](https://github.com/wodby/wordpress/tree/master/4/Dockerfile) | 4.x       | 7.1 |
| [4-7.0-debug](https://github.com/wodby/wordpress/tree/master/4/Dockerfile) | 4.x       | 7.0 |
| [4-5.6-debug](https://github.com/wodby/wordpress/tree/master/4/Dockerfile) | 4.x       | 5.6 |

## Environment Variables

See at [wodby/wordpress-php](https://github.com/wodby/wordpress-php)

## Complete WordPress Stack

See [Docker4WordPress](https://github.com/wodby/docker4wordpress).