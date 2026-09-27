# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:521fd10c96b34632e9a41b924260f8077a5b0a5449ec8b47207345fb83826ae1
BASE_IMAGE_DIGEST_8.2-r6 := sha256:ed97ff4389b474baddb66af887f18faab3fdf8b022a24555444d68609e7a52de
BASE_IMAGE_DIGEST_8.3 := sha256:23a4cc364ace20be233116e5236beef518cd6bf24845d947c62de5c4effe9748
BASE_IMAGE_DIGEST_8.3-r6 := sha256:7f2bc745ce73c20ec9f13b27f4f14ce6219e4e2759bbc7ffc26d5e7c38be80ca
BASE_IMAGE_DIGEST_8.4 := sha256:7412412130940b10df0dc6dff340655bd738f2aedc3b8623367de0f9fe983334
BASE_IMAGE_DIGEST_8.4-r6 := sha256:6e1a69479d2656ec8ac7b9beaa306e08f7a05618d790c3223a3a4630723df512
BASE_IMAGE_DIGEST_8.5 := sha256:368225737cfa5ae612890129d3ff0653ade58b65911b3e63dd476c77611afb04
BASE_IMAGE_DIGEST_8.5-r6 := sha256:44a877eb9e5636098f6e6dec0b150013fc1fe945c1e4547df787fe48cb4faba1

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
