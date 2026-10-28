# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:96696f281459dc3de1b9372f501068c4b996be848c6813caa2a9d6bb7c797edf
BASE_IMAGE_DIGEST_8.2-r14 := sha256:d068e7f82856e55cb1e9448bbb17c0d8b9d7039e0610c44068373d4bb78591cf
BASE_IMAGE_DIGEST_8.3 := sha256:154b8c86eeb75316b1b041ff0159e82f8d9a24779d4c918fa098c5bbaa8c6ce8
BASE_IMAGE_DIGEST_8.3-r14 := sha256:cbe2aca76f84ea34393a1b5011400ef15d623c4fdcbf044a83a440d353f9c175
BASE_IMAGE_DIGEST_8.4 := sha256:c407caa86f7c75fa2bb698c2236244f5adf43904fa53b6886117ad708c657783
BASE_IMAGE_DIGEST_8.4-r14 := sha256:d165335eeac368dbcb1d4432bb22f57bacbd4fa5938f1d411a87ecb01de9e13a
BASE_IMAGE_DIGEST_8.5 := sha256:556dd211bcbbdd9a5dbd4d3e6fc46bb3fa3c8630df6ded9b18fbd25def48bd83
BASE_IMAGE_DIGEST_8.5-r14 := sha256:b88255f9dd206220835882fc66a390ef7423d2e60e5666661c22757bcd5560bc

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
