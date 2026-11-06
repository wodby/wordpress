# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:b78fe7cebf9c51f7a097d9119a49d480fb39c8937beba019ffaa39621e39d61b
BASE_IMAGE_DIGEST_8.2-r16 := sha256:20472c53c149fc2365eea2c2cddf040e0c99f94c8f42300ad1c1a8b831721ae1
BASE_IMAGE_DIGEST_8.3 := sha256:e8d8dc47e37950789951cc091efa8ca51d8362be9ac9d02bce82de83c0f19a82
BASE_IMAGE_DIGEST_8.3-r16 := sha256:6f680e62ea9f95bbce8d0efc4436cff4dca6c94131d8bd8ef96589dbf098695e
BASE_IMAGE_DIGEST_8.4 := sha256:939d9e36403f4d842a24457d13ef806f1015eae2c833dc4d3f31ae7befb8fb5e
BASE_IMAGE_DIGEST_8.4-r16 := sha256:5b6cf813ab91626919700aa9f15d8a5a2ccc0a88e1df8b93cbb65f923dad4c54
BASE_IMAGE_DIGEST_8.5 := sha256:5c63105d7d3e9e1aa1f5bd3f7a45156ee614bbe17c6ec23090c34cdf34bee4d3
BASE_IMAGE_DIGEST_8.5-r16 := sha256:74df30233014114bb484b51e43fd17e2967d415323b5a14adc21ccf4e64ab318

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
