# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:0bda6429940817a876ce3f5daeb837a7197a4b6625014b78abaf5ee078eab2eb
BASE_IMAGE_DIGEST_8.2-r19 := sha256:2ca7b20df28185b1a88f52cc26e42d2722f95a226f98cdf663ea8b7d79d1747a
BASE_IMAGE_DIGEST_8.3 := sha256:fd5c634800e4e74858e334240e49eb6dbaf8f19af6eda95dcfe895c7468b11bd
BASE_IMAGE_DIGEST_8.3-r19 := sha256:87438b1c417b7d161999d050f09f0b9b970409e36d086a4bea1c6885339e0a71
BASE_IMAGE_DIGEST_8.4 := sha256:d5a0d7ef18ec0af52315a6072168f2d2933df20e868d187e0134a7e4428dea06
BASE_IMAGE_DIGEST_8.4-r19 := sha256:088164bd55454981628b742f74204700519d4640304d8df7088ac22333ecb621
BASE_IMAGE_DIGEST_8.5 := sha256:86295527cda04a25334620dfe00e7797059b014cabd3c8b87c3a22d8f2a5757c
BASE_IMAGE_DIGEST_8.5-r19 := sha256:1fb86e4ab6ab07ae2b3cbaf9db2324f6af47bdc9ffacab94f2d3ad345bef766e

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
