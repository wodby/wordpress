# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:80a43c817a9a7d0aec7416bdcb1ce7de6b537a8b63b8abe22c620be8cbf44123
BASE_IMAGE_DIGEST_8.2-r7 := sha256:c10f242a999b597cb673c0bc7e0f8c819c771f9d192f40b3925a075a10300318
BASE_IMAGE_DIGEST_8.3 := sha256:fb36ad5a5a2a1f3abecc7be233a6b80c618bc8233c5133beeade6a5239c8b142
BASE_IMAGE_DIGEST_8.3-r7 := sha256:23a4cc364ace20be233116e5236beef518cd6bf24845d947c62de5c4effe9748
BASE_IMAGE_DIGEST_8.4 := sha256:2813552af4b455a2a65d718b4d70f84f6393a2deefc789ae5164ef850b9e9f70
BASE_IMAGE_DIGEST_8.4-r7 := sha256:7412412130940b10df0dc6dff340655bd738f2aedc3b8623367de0f9fe983334
BASE_IMAGE_DIGEST_8.5 := sha256:ca54135366345b4155fc12d07657e7f3c252bee9fd91d4874943174fb4bb579f
BASE_IMAGE_DIGEST_8.5-r7 := sha256:368225737cfa5ae612890129d3ff0653ade58b65911b3e63dd476c77611afb04

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
