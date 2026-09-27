# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:87915a51398ffbe42684b567eb15da0655cbbf73bba512ac20d3aac4db82a9e6
BASE_IMAGE_DIGEST_8.2-r6 := sha256:ed97ff4389b474baddb66af887f18faab3fdf8b022a24555444d68609e7a52de
BASE_IMAGE_DIGEST_8.3 := sha256:a0f135f13fff8924862f3e7fba9028060b6245403e8be5152a5f9534b890d7c3
BASE_IMAGE_DIGEST_8.3-r6 := sha256:7f2bc745ce73c20ec9f13b27f4f14ce6219e4e2759bbc7ffc26d5e7c38be80ca
BASE_IMAGE_DIGEST_8.4 := sha256:9ed1821374ca75108ce3032fb534f87284aa85842200b6452a60ea6a940fffc9
BASE_IMAGE_DIGEST_8.4-r6 := sha256:6e1a69479d2656ec8ac7b9beaa306e08f7a05618d790c3223a3a4630723df512
BASE_IMAGE_DIGEST_8.5 := sha256:0e224a7bed4025c3790610a6de6e07d4785666cdf883b3d767aa3072ad1cf15a
BASE_IMAGE_DIGEST_8.5-r6 := sha256:44a877eb9e5636098f6e6dec0b150013fc1fe945c1e4547df787fe48cb4faba1

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
