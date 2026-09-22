# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:970f9c168fee493e5e2ac01813cc1f400bb918712cd2729e2d5250e889cac53c
BASE_IMAGE_DIGEST_8.2-r1 := sha256:c5819da88cfa2446764bcd58f10b77dc36a9b3c9514a40547479e11842c984c8
BASE_IMAGE_DIGEST_8.3 := sha256:04297686ef82883220f386059c4135875317daac71d867f958fe9808ee4afaa3
BASE_IMAGE_DIGEST_8.3-r1 := sha256:f3e98c1795d5e7163ab0cebc8eef1e969231bdc1284c262928fddf68811d2135
BASE_IMAGE_DIGEST_8.4 := sha256:e8f89640ffa34ea2063e72f1402130cc8a2c3c2d7d8c57862edc58e37018dbdd
BASE_IMAGE_DIGEST_8.4-r1 := sha256:df63a30ea35a5efc5d8b4cb0bde8824a5adc9825bcefca811ec11dfdb164405b
BASE_IMAGE_DIGEST_8.5 := sha256:11e971553627ebd1e0e7c72a30afc1e02584d7962c97bd0cd9a70c3be9f7220e
BASE_IMAGE_DIGEST_8.5-r1 := sha256:08114d91335ed02f9ab0227e470373670a165535fb8e2ac576bdffbec664b92c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
