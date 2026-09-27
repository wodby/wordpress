# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:87915a51398ffbe42684b567eb15da0655cbbf73bba512ac20d3aac4db82a9e6
BASE_IMAGE_DIGEST_8.2-r5 := sha256:3cd512530f5b258e67e0cbe531ba1e2062f23992eceb70db40e4dfcf85efce55
BASE_IMAGE_DIGEST_8.3 := sha256:a0f135f13fff8924862f3e7fba9028060b6245403e8be5152a5f9534b890d7c3
BASE_IMAGE_DIGEST_8.3-r5 := sha256:bf391242a57f2aad571795866d7e92fe2b0f2f0130ebd87204e438c68cacfa8b
BASE_IMAGE_DIGEST_8.4 := sha256:9ed1821374ca75108ce3032fb534f87284aa85842200b6452a60ea6a940fffc9
BASE_IMAGE_DIGEST_8.4-r5 := sha256:e7e1a7254f3b2f29625bb28e80f5a647f9d7d6643987219e821fabc056010d50
BASE_IMAGE_DIGEST_8.5 := sha256:0e224a7bed4025c3790610a6de6e07d4785666cdf883b3d767aa3072ad1cf15a
BASE_IMAGE_DIGEST_8.5-r5 := sha256:e87b1dfea0b1b2d910adb0cf6593bde7404db2da2f93fdc724bc61d005c21e8c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
