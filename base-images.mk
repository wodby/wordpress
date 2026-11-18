# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:63c2cd6a1920d5d6e6fb4adef68e83be88c7d9bc442a56cace8d0bad21eb7131
BASE_IMAGE_DIGEST_8.2-r19 := sha256:2ca7b20df28185b1a88f52cc26e42d2722f95a226f98cdf663ea8b7d79d1747a
BASE_IMAGE_DIGEST_8.3 := sha256:c9a962d936a0f4b6725a9c11ddf575b4f35241cdedc92c380b3221e3f892705d
BASE_IMAGE_DIGEST_8.3-r19 := sha256:87438b1c417b7d161999d050f09f0b9b970409e36d086a4bea1c6885339e0a71
BASE_IMAGE_DIGEST_8.4 := sha256:5fe2dda178f8e4dc905df1099eec35b2537bf211f1b8e3b3aaaacdd9ee2e0d9f
BASE_IMAGE_DIGEST_8.4-r19 := sha256:088164bd55454981628b742f74204700519d4640304d8df7088ac22333ecb621
BASE_IMAGE_DIGEST_8.5 := sha256:a9e05de0c727d39d5285bd7b28cb321ee4cb619ec854ff70dc711a3ba0c4c68a
BASE_IMAGE_DIGEST_8.5-r19 := sha256:1fb86e4ab6ab07ae2b3cbaf9db2324f6af47bdc9ffacab94f2d3ad345bef766e

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
