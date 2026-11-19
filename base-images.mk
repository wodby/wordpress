# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:d3eae661e6e389e797b82fb95b7fb2123276d314fd2291ae4d4d081825e7cb2f
BASE_IMAGE_DIGEST_8.2-r19 := sha256:2ca7b20df28185b1a88f52cc26e42d2722f95a226f98cdf663ea8b7d79d1747a
BASE_IMAGE_DIGEST_8.3 := sha256:01ed7fe9ce1d54612ee1bc53ed789e4b535f7587b14205e1dd093a1e16cbb84f
BASE_IMAGE_DIGEST_8.3-r19 := sha256:87438b1c417b7d161999d050f09f0b9b970409e36d086a4bea1c6885339e0a71
BASE_IMAGE_DIGEST_8.4 := sha256:5564a6b82c6cdff985bfb08ef0e56ea21e3b6b2f2575ec860d5dc7281749cc4c
BASE_IMAGE_DIGEST_8.4-r19 := sha256:088164bd55454981628b742f74204700519d4640304d8df7088ac22333ecb621
BASE_IMAGE_DIGEST_8.5 := sha256:03434f71c25bbb42eb40f8be4f5dcf4d4cf672c9d5839ec5154cc0465f588bf5
BASE_IMAGE_DIGEST_8.5-r19 := sha256:1fb86e4ab6ab07ae2b3cbaf9db2324f6af47bdc9ffacab94f2d3ad345bef766e

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
