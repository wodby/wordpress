# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:b2e6081d025c1fd0c221a99fdfa588aadd0d8f1ced2cc3c64f7087cdca3f59c2
BASE_IMAGE_DIGEST_8.2-r7 := sha256:c10f242a999b597cb673c0bc7e0f8c819c771f9d192f40b3925a075a10300318
BASE_IMAGE_DIGEST_8.3 := sha256:4ada214c7d040a58cebd67c4fd26615e8cfad7abebd6dbe2f6510c6711242892
BASE_IMAGE_DIGEST_8.3-r7 := sha256:23a4cc364ace20be233116e5236beef518cd6bf24845d947c62de5c4effe9748
BASE_IMAGE_DIGEST_8.4 := sha256:e6b7f95b9441b7298a4247bb5d9cb29e7316304c3209543c0f4608299a28cfb8
BASE_IMAGE_DIGEST_8.4-r7 := sha256:7412412130940b10df0dc6dff340655bd738f2aedc3b8623367de0f9fe983334
BASE_IMAGE_DIGEST_8.5 := sha256:c02cfbc0414e8dc79037e69a0f6e5112ce2efffcacb68cdf4bfc73d4f5abee88
BASE_IMAGE_DIGEST_8.5-r7 := sha256:368225737cfa5ae612890129d3ff0653ade58b65911b3e63dd476c77611afb04

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
