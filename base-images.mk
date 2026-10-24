# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:8fc91db0ebb0b0d59758b26c44360657fcd9eebb135525eae5630cf9d262e4b6
BASE_IMAGE_DIGEST_8.2-r12 := sha256:d65bf0fc62b0e173079a401d96964b88330af8a567ce2d1f0bfe7b5823bb7f8e
BASE_IMAGE_DIGEST_8.3 := sha256:f4fd666f92f7181ce556e29df602f5421209321d3c13d843b463de45edc579f2
BASE_IMAGE_DIGEST_8.3-r12 := sha256:1a4b2d0b7c714507ac63577b06e29d2e948f038af5604fce2fd61282bf909762
BASE_IMAGE_DIGEST_8.4 := sha256:de9c28cba687d619a83acc2a3a3054d64f2a11dffbf4ca238a27af0e70974645
BASE_IMAGE_DIGEST_8.4-r12 := sha256:593fcc083996c1d037a04d5c6646a565ac11905b8d37f6fb5809a8be0fa38818
BASE_IMAGE_DIGEST_8.5 := sha256:7406f0a1dd406784b2adfba6a274ee44f06a884fe9d558891437ac34c2bbbb56
BASE_IMAGE_DIGEST_8.5-r12 := sha256:49fe7096d0a0876e97f2b7c94286785b6cad21857b07bfaf0b997cf68f56e8a5

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
