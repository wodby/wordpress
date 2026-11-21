# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:3ae619ed51f3b5ae6e3ae34d03f263f9d78985ed53405370e7c876c4061b9fbb
BASE_IMAGE_DIGEST_8.2-r21 := sha256:9f9ee043f2b3b3c26c5d1ddcc8ca988b1216556430f7c9dcbad36cd373cae776
BASE_IMAGE_DIGEST_8.3 := sha256:371356d75032156743639b4fe8dc51cfa20ddff826d6e6f0d4912ba76b5ade5c
BASE_IMAGE_DIGEST_8.3-r21 := sha256:93772afe11d3f33527b0a5492301d5d245578c40d6a9f09600c4c6b3afd784bc
BASE_IMAGE_DIGEST_8.4 := sha256:9d8de6f0304d05c41dbcc2edba8d883aeafe5b32611a86d850c2923e57ecd157
BASE_IMAGE_DIGEST_8.4-r21 := sha256:17eaf9292eed6b614c8e6551711682390f41629b3db81c5b051151685be523d4
BASE_IMAGE_DIGEST_8.5 := sha256:767fe2bd4c292af2794fd1b080c797c4b77cee8a11bfcf3a37ace677610476d9
BASE_IMAGE_DIGEST_8.5-r21 := sha256:8af09d8ed8eeadeb9f2d39fd9952fdce73328190b66dbc9068d21d37c2376cd0

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
