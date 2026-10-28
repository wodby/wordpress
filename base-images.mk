# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:96696f281459dc3de1b9372f501068c4b996be848c6813caa2a9d6bb7c797edf
BASE_IMAGE_DIGEST_8.2-r13 := sha256:52160cc710a5e66eb331c06a5e0a89e04a5f4bce631d13f5d3d40627bbffbb22
BASE_IMAGE_DIGEST_8.3 := sha256:154b8c86eeb75316b1b041ff0159e82f8d9a24779d4c918fa098c5bbaa8c6ce8
BASE_IMAGE_DIGEST_8.3-r13 := sha256:1e8f2ab8459266ca1e5e73433dad822efd8b304aaba6756302e813d9de31bde4
BASE_IMAGE_DIGEST_8.4 := sha256:c407caa86f7c75fa2bb698c2236244f5adf43904fa53b6886117ad708c657783
BASE_IMAGE_DIGEST_8.4-r13 := sha256:3fb628ba08bf3f87cc816ed970b222b74030cc22ed45eae4f07d71a59774f650
BASE_IMAGE_DIGEST_8.5 := sha256:556dd211bcbbdd9a5dbd4d3e6fc46bb3fa3c8630df6ded9b18fbd25def48bd83
BASE_IMAGE_DIGEST_8.5-r13 := sha256:faf890d947637416535f3f7aba39a84b7178d2afea13bdaccc08c77ba9147f6a

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
