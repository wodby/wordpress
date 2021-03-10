-include env_make

WORDPRESS_VER ?= 5.7

WORDPRESS_VER_MAJOR ?= $(shell echo "${WORDPRESS_VER}" | grep -oE '^[0-9]+')

PHP_VER ?= 8.0
BASE_IMAGE_TAG = $(PHP_VER)

REPO = wodby/wordpress
NAME = wordpress-$(WORDPRESS_VER_MAJOR)-$(PHP_VER)

TAG ?= $(WORDPRESS_VER_MAJOR)-$(PHP_VER)

PLATFORM ?= linux/amd64

ifneq ($(PHP_DEBUG),)
    TAG := $(TAG)-debug
endif

ifneq ($(BASE_IMAGE_STABILITY_TAG),)
    BASE_IMAGE_TAG := $(BASE_IMAGE_TAG)-$(BASE_IMAGE_STABILITY_TAG)
endif

ifneq ($(PHP_DEBUG),)
    NAME := $(NAME)-debug
    BASE_IMAGE_TAG := $(BASE_IMAGE_TAG)-debug
endif

ifneq ($(STABILITY_TAG),)
    ifneq ($(TAG),latest)
        override TAG := $(TAG)-$(STABILITY_TAG)
    endif
endif

.PHONY: build buildx-build buildx-build-amd64 buildx-push test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) \
		--build-arg WORDPRESS_VER=$(WORDPRESS_VER) \
		./

# --load doesn't work with multiple platforms https://github.com/docker/buildx/issues/59
# we need to save cache to run tests first.
buildx-build-amd64:
	docker buildx build --platform linux/amd64 -t $(REPO):$(TAG) \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) \
		--build-arg WORDPRESS_VER=$(WORDPRESS_VER) \
		--load \
		./

buildx-build:
	docker buildx build --platform $(PLATFORM) -t $(REPO):$(TAG) \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) \
		--build-arg WORDPRESS_VER=$(WORDPRESS_VER) \
		./

buildx-push:
	docker buildx build --platform $(PLATFORM) --push -t $(REPO):$(TAG) \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) \
		--build-arg WORDPRESS_VER=$(WORDPRESS_VER) \
		./

test:
	cd ./tests && IMAGE=$(REPO):$(TAG) WORDPRESS_VER=$(WORDPRESS_VER) ./run.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

check-configs:
	./check-configs.sh $(WORDPRESS_VER)

release: build push
