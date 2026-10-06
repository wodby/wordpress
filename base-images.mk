# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:85251a38d3a7732d3e0dc2944e36df92193cb8a4520ab477887c4e5e021a3f1b
BASE_IMAGE_DIGEST_8.2-r9 := sha256:85251a38d3a7732d3e0dc2944e36df92193cb8a4520ab477887c4e5e021a3f1b
BASE_IMAGE_DIGEST_8.3 := sha256:9d608872972e0390abc88cec56fa455adc97b55391bd39c39e62f4d684488737
BASE_IMAGE_DIGEST_8.3-r9 := sha256:9d608872972e0390abc88cec56fa455adc97b55391bd39c39e62f4d684488737
BASE_IMAGE_DIGEST_8.4 := sha256:b7b4f1aad97f6e593db5cd926c4883c16a0bc4ae912de263c9bb5dde93663005
BASE_IMAGE_DIGEST_8.4-r9 := sha256:b7b4f1aad97f6e593db5cd926c4883c16a0bc4ae912de263c9bb5dde93663005
BASE_IMAGE_DIGEST_8.5 := sha256:56bb7198023b0baf37ab718c121a8d9c4dfe66cef21794fb1816a9bd245fb655
BASE_IMAGE_DIGEST_8.5-r9 := sha256:56bb7198023b0baf37ab718c121a8d9c4dfe66cef21794fb1816a9bd245fb655

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
