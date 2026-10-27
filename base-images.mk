# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:7798f616cf10dce953b3b1f412d8cd69b173baa62cea5a55daf724febb7e9952
BASE_IMAGE_DIGEST_8.2-r13 := sha256:52160cc710a5e66eb331c06a5e0a89e04a5f4bce631d13f5d3d40627bbffbb22
BASE_IMAGE_DIGEST_8.3 := sha256:27f2183964b98a35e7c1b361ab36663d5fff15bfdded708b1bf2adca22e52772
BASE_IMAGE_DIGEST_8.3-r13 := sha256:1e8f2ab8459266ca1e5e73433dad822efd8b304aaba6756302e813d9de31bde4
BASE_IMAGE_DIGEST_8.4 := sha256:c1ace8d3776c1f99c42a857679785ed320ee75357df00151ec0fc4d4504c4862
BASE_IMAGE_DIGEST_8.4-r13 := sha256:3fb628ba08bf3f87cc816ed970b222b74030cc22ed45eae4f07d71a59774f650
BASE_IMAGE_DIGEST_8.5 := sha256:b00ef824e3db72503169081be63c3eafeae5daf72517fa839fe085a882d6594f
BASE_IMAGE_DIGEST_8.5-r13 := sha256:faf890d947637416535f3f7aba39a84b7178d2afea13bdaccc08c77ba9147f6a

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
