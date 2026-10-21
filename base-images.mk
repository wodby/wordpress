# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:975a753f7d531bf682d55ae98c79ab2521e7546c94d51c588c503b6d623fe801
BASE_IMAGE_DIGEST_8.2-r10 := sha256:0a4a67c015aa408e9a6377a2d35e52514cd42002721aedc5ab53cd9afde431aa
BASE_IMAGE_DIGEST_8.3 := sha256:b79e64fd00bb7c6dd3cb4d7fb3ee75ac8f0ad9f65a26f91b1098b5e7b54bc874
BASE_IMAGE_DIGEST_8.3-r10 := sha256:20e09ad4af562a5fd508ea94ce68d5c3356188472699e9d525f33b4a2dbaea41
BASE_IMAGE_DIGEST_8.4 := sha256:63e3830a84054c2e8178d70108a1906138126b0727adb4ead0847a801d32b25b
BASE_IMAGE_DIGEST_8.4-r10 := sha256:d81c74149de4ed9c494f40cbd54f276e3fe199e902ce6e13bbfd348e2ed19009
BASE_IMAGE_DIGEST_8.5 := sha256:d52c38bf6aa1988f3f55cf14404839dd86479fe4e89a430c821f6a7f8762b935
BASE_IMAGE_DIGEST_8.5-r10 := sha256:efe7441066a3771fbd3b0be5322881bba87a17a7bb57f9f15e2e8c79d3456965

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
