# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:f7bd1e319047fc0d4072897f88f07f8053f6e85c93e4b4a0411a810152c04fa2
BASE_IMAGE_DIGEST_8.2-r17 := sha256:21183df722ffe902d4b9c9893feab9f0d646add67254c937c7a6f7652d0742fc
BASE_IMAGE_DIGEST_8.3 := sha256:b8b33e46c357c1c346a7a21c30cbaf7e70daf7088b9ca3ba20ecd73147df584c
BASE_IMAGE_DIGEST_8.3-r17 := sha256:be10331ca47da0c436d7748ba97182c38ac6b5cc103f3376542d72a450e6b443
BASE_IMAGE_DIGEST_8.4 := sha256:8fc3cf37a9a5f3c4ffc0de60e064325dde06fd236dc75c74ed17f49d461abbb9
BASE_IMAGE_DIGEST_8.4-r17 := sha256:1c466f30283be1254167cad76a5fce82efe1359a7c95dd05e760014503b33baa
BASE_IMAGE_DIGEST_8.5 := sha256:be412ef2802f90193ec4afe819e64d3eed1642789f4dc635c98e47d4ba5130f1
BASE_IMAGE_DIGEST_8.5-r17 := sha256:01f6b5588833e869e439e2517860cd9acb1082906f8c1e860fb601db6778fa45

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
