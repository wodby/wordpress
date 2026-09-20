# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:5df00d1d7295eb94483ae9dd3a09a2f1c0a340e4cf72001e6359e4d82703266d
BASE_IMAGE_DIGEST_8.2-r1 := sha256:c5819da88cfa2446764bcd58f10b77dc36a9b3c9514a40547479e11842c984c8
BASE_IMAGE_DIGEST_8.3 := sha256:5721961e6d1e96b53abc8af523d306908a42cbb2a183807be958be427a222124
BASE_IMAGE_DIGEST_8.3-r1 := sha256:f3e98c1795d5e7163ab0cebc8eef1e969231bdc1284c262928fddf68811d2135
BASE_IMAGE_DIGEST_8.4 := sha256:734d8e6e7d585db7c54097d622acfccf52878a1b48b1569c39c2070f89971df1
BASE_IMAGE_DIGEST_8.4-r1 := sha256:df63a30ea35a5efc5d8b4cb0bde8824a5adc9825bcefca811ec11dfdb164405b
BASE_IMAGE_DIGEST_8.5 := sha256:cfa02f9e98f102fd050d71f2a19c831cf93e60b6b945c0a523a341d8440004ae
BASE_IMAGE_DIGEST_8.5-r1 := sha256:08114d91335ed02f9ab0227e470373670a165535fb8e2ac576bdffbec664b92c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
