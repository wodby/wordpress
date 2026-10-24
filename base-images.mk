# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:e32921bee2f119805cbc66cfade907e6a8ea9db6e0e0252ed8f70529fa4e4506
BASE_IMAGE_DIGEST_8.2-r13 := sha256:52160cc710a5e66eb331c06a5e0a89e04a5f4bce631d13f5d3d40627bbffbb22
BASE_IMAGE_DIGEST_8.3 := sha256:77e57bf97101670fdb0914473e96ec5dda96b282a08e144aa576a37a8b9d3f95
BASE_IMAGE_DIGEST_8.3-r13 := sha256:1e8f2ab8459266ca1e5e73433dad822efd8b304aaba6756302e813d9de31bde4
BASE_IMAGE_DIGEST_8.4 := sha256:830914828353b37018241654d6b0badf856fa3ee87da72718327861420fdee94
BASE_IMAGE_DIGEST_8.4-r13 := sha256:3fb628ba08bf3f87cc816ed970b222b74030cc22ed45eae4f07d71a59774f650
BASE_IMAGE_DIGEST_8.5 := sha256:02bda431a810273bd0cb1b5cfbcab083b6575294481d6877fb7fa57b6956b9d4
BASE_IMAGE_DIGEST_8.5-r13 := sha256:faf890d947637416535f3f7aba39a84b7178d2afea13bdaccc08c77ba9147f6a

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
