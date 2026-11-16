# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:f642842a447cdedf4c4d03a1ca597ea528b3bdab6f712705692fdf3ceacddc2a
BASE_IMAGE_DIGEST_8.2-r19 := sha256:2ca7b20df28185b1a88f52cc26e42d2722f95a226f98cdf663ea8b7d79d1747a
BASE_IMAGE_DIGEST_8.3 := sha256:f67df1f94615f5e34cc7f3624d36107c4ff2511cc530a13254b4ee6910c8e0fa
BASE_IMAGE_DIGEST_8.3-r19 := sha256:87438b1c417b7d161999d050f09f0b9b970409e36d086a4bea1c6885339e0a71
BASE_IMAGE_DIGEST_8.4 := sha256:9519cb95cc135644a8865579b7f31ba81a0a9487d8bb3b2d490176e4fc25fb5d
BASE_IMAGE_DIGEST_8.4-r19 := sha256:088164bd55454981628b742f74204700519d4640304d8df7088ac22333ecb621
BASE_IMAGE_DIGEST_8.5 := sha256:21c823a773c9fed9519d5d95e9fbb35ea86d290557ac838bfd6a8241487343b1
BASE_IMAGE_DIGEST_8.5-r19 := sha256:1fb86e4ab6ab07ae2b3cbaf9db2324f6af47bdc9ffacab94f2d3ad345bef766e

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
