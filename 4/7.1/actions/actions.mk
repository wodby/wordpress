-include /usr/local/bin/wordpress-php.mk

.PHONY: check-ready

max_try ?= 10
wait_seconds ?= 1

check-ready:
	wait-for-wp-copy.sh $(max_try) $(wait_seconds)
