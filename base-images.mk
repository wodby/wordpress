# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:b9f3b35dcca79738a9d1dd3458c9921a12d481636fc786f1c8c66cba485226a3
BASE_IMAGE_DIGEST_8.2-r12 := sha256:d65bf0fc62b0e173079a401d96964b88330af8a567ce2d1f0bfe7b5823bb7f8e
BASE_IMAGE_DIGEST_8.3 := sha256:48902ce33f55283536fd98b5b3ef5c20f3cd3c742d7ab87fb04b0001e8f632c7
BASE_IMAGE_DIGEST_8.3-r12 := sha256:1a4b2d0b7c714507ac63577b06e29d2e948f038af5604fce2fd61282bf909762
BASE_IMAGE_DIGEST_8.4 := sha256:58ea52488c3e2d5126de6bfcecead665ed15f6aa2a04b4f64a578d2d6403421d
BASE_IMAGE_DIGEST_8.4-r12 := sha256:593fcc083996c1d037a04d5c6646a565ac11905b8d37f6fb5809a8be0fa38818
BASE_IMAGE_DIGEST_8.5 := sha256:faf890d947637416535f3f7aba39a84b7178d2afea13bdaccc08c77ba9147f6a
BASE_IMAGE_DIGEST_8.5-r12 := sha256:49fe7096d0a0876e97f2b7c94286785b6cad21857b07bfaf0b997cf68f56e8a5

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
