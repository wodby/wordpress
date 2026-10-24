# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:b9f3b35dcca79738a9d1dd3458c9921a12d481636fc786f1c8c66cba485226a3
BASE_IMAGE_DIGEST_8.2-r13 := sha256:52160cc710a5e66eb331c06a5e0a89e04a5f4bce631d13f5d3d40627bbffbb22
BASE_IMAGE_DIGEST_8.3 := sha256:48902ce33f55283536fd98b5b3ef5c20f3cd3c742d7ab87fb04b0001e8f632c7
BASE_IMAGE_DIGEST_8.3-r13 := sha256:1e8f2ab8459266ca1e5e73433dad822efd8b304aaba6756302e813d9de31bde4
BASE_IMAGE_DIGEST_8.4 := sha256:58ea52488c3e2d5126de6bfcecead665ed15f6aa2a04b4f64a578d2d6403421d
BASE_IMAGE_DIGEST_8.4-r13 := sha256:3fb628ba08bf3f87cc816ed970b222b74030cc22ed45eae4f07d71a59774f650
BASE_IMAGE_DIGEST_8.5 := sha256:faf890d947637416535f3f7aba39a84b7178d2afea13bdaccc08c77ba9147f6a
BASE_IMAGE_DIGEST_8.5-r13 := sha256:faf890d947637416535f3f7aba39a84b7178d2afea13bdaccc08c77ba9147f6a

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
