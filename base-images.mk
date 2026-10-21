# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:57062dd74ae8c5d64345b3f86c969211a3c53c973015e65cafcab5a3a5144463
BASE_IMAGE_DIGEST_8.2-r11 := sha256:57062dd74ae8c5d64345b3f86c969211a3c53c973015e65cafcab5a3a5144463
BASE_IMAGE_DIGEST_8.3 := sha256:42f73a4cee4c212eb1d77f502952e7ddf94dd1efe26fb33735ed3e01fd7afe6b
BASE_IMAGE_DIGEST_8.3-r11 := sha256:42f73a4cee4c212eb1d77f502952e7ddf94dd1efe26fb33735ed3e01fd7afe6b
BASE_IMAGE_DIGEST_8.4 := sha256:5b2ff535eeaffd61221fdf2030964bf896ecacadf7464d88276a036aa19a99b3
BASE_IMAGE_DIGEST_8.4-r11 := sha256:5b2ff535eeaffd61221fdf2030964bf896ecacadf7464d88276a036aa19a99b3
BASE_IMAGE_DIGEST_8.5 := sha256:f8c5ba87e8ee7930501ada1fc947d89b851e01e8acfa7af82930837541ea5dc0
BASE_IMAGE_DIGEST_8.5-r11 := sha256:f8c5ba87e8ee7930501ada1fc947d89b851e01e8acfa7af82930837541ea5dc0

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
