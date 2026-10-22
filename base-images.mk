# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:d65bf0fc62b0e173079a401d96964b88330af8a567ce2d1f0bfe7b5823bb7f8e
BASE_IMAGE_DIGEST_8.2-r11 := sha256:57062dd74ae8c5d64345b3f86c969211a3c53c973015e65cafcab5a3a5144463
BASE_IMAGE_DIGEST_8.3 := sha256:1a4b2d0b7c714507ac63577b06e29d2e948f038af5604fce2fd61282bf909762
BASE_IMAGE_DIGEST_8.3-r11 := sha256:42f73a4cee4c212eb1d77f502952e7ddf94dd1efe26fb33735ed3e01fd7afe6b
BASE_IMAGE_DIGEST_8.4 := sha256:593fcc083996c1d037a04d5c6646a565ac11905b8d37f6fb5809a8be0fa38818
BASE_IMAGE_DIGEST_8.4-r11 := sha256:5b2ff535eeaffd61221fdf2030964bf896ecacadf7464d88276a036aa19a99b3
BASE_IMAGE_DIGEST_8.5 := sha256:49fe7096d0a0876e97f2b7c94286785b6cad21857b07bfaf0b997cf68f56e8a5
BASE_IMAGE_DIGEST_8.5-r11 := sha256:f8c5ba87e8ee7930501ada1fc947d89b851e01e8acfa7af82930837541ea5dc0

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
