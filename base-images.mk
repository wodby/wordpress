# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:24a794d6be49f5648cfec82effa4e8cedcf7a4b619d1b8c6d70eb837c5a9481a
BASE_IMAGE_DIGEST_8.2-r1 := sha256:c5819da88cfa2446764bcd58f10b77dc36a9b3c9514a40547479e11842c984c8
BASE_IMAGE_DIGEST_8.3 := sha256:7e32f83034ff73705c95d81048d8fc23fe45300eb57f5da541e24838125c4db1
BASE_IMAGE_DIGEST_8.3-r1 := sha256:f3e98c1795d5e7163ab0cebc8eef1e969231bdc1284c262928fddf68811d2135
BASE_IMAGE_DIGEST_8.4 := sha256:bf16b70311ef7c86164471cb30458c2b2c110d50f5a097371cd8b9ea65a86746
BASE_IMAGE_DIGEST_8.4-r1 := sha256:df63a30ea35a5efc5d8b4cb0bde8824a5adc9825bcefca811ec11dfdb164405b
BASE_IMAGE_DIGEST_8.5 := sha256:f4baf1393c862d0af6574e504e61ee21ce131ddd2e71cc3364a9a523dcc46403
BASE_IMAGE_DIGEST_8.5-r1 := sha256:08114d91335ed02f9ab0227e470373670a165535fb8e2ac576bdffbec664b92c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
