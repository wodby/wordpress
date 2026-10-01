# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:3ff6ef6d25978af6f72219613aadcbe010070ce04a738fd92779790916a18c45
BASE_IMAGE_DIGEST_8.2-r7 := sha256:c10f242a999b597cb673c0bc7e0f8c819c771f9d192f40b3925a075a10300318
BASE_IMAGE_DIGEST_8.3 := sha256:ae85830e8fcd19710f93802ad18ac1ad01230b72956cce2c6af91ac18dd8e715
BASE_IMAGE_DIGEST_8.3-r7 := sha256:23a4cc364ace20be233116e5236beef518cd6bf24845d947c62de5c4effe9748
BASE_IMAGE_DIGEST_8.4 := sha256:8bd50a40aefe0b56c4be9a5d9604ca1240a71d8683a6998e4957bd150216ece0
BASE_IMAGE_DIGEST_8.4-r7 := sha256:7412412130940b10df0dc6dff340655bd738f2aedc3b8623367de0f9fe983334
BASE_IMAGE_DIGEST_8.5 := sha256:c26a43e9d2bbab7ebbf6df201c95f49bf67b3ebdc600d79b98d15fd6deed54bb
BASE_IMAGE_DIGEST_8.5-r7 := sha256:368225737cfa5ae612890129d3ff0653ade58b65911b3e63dd476c77611afb04

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
