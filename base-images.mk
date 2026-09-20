# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:83944321bb5976bf73af3e6ef811633214f5a326889655a3f6cd2ca7649cfce1
BASE_IMAGE_DIGEST_8.2-r1 := sha256:c5819da88cfa2446764bcd58f10b77dc36a9b3c9514a40547479e11842c984c8
BASE_IMAGE_DIGEST_8.3 := sha256:8175ace982e115170899da7b3c9e9f60b6ff115041714225456160dd12409891
BASE_IMAGE_DIGEST_8.3-r1 := sha256:f3e98c1795d5e7163ab0cebc8eef1e969231bdc1284c262928fddf68811d2135
BASE_IMAGE_DIGEST_8.4 := sha256:82e6d8279ea36d274924d88470638586af54582eb136e74998fc6ce288c78ebd
BASE_IMAGE_DIGEST_8.4-r1 := sha256:df63a30ea35a5efc5d8b4cb0bde8824a5adc9825bcefca811ec11dfdb164405b
BASE_IMAGE_DIGEST_8.5 := sha256:0613935ae9edeaedb1b9d2bbbaceff38d0efcf6afab43b1d16ca626335cf9fd0
BASE_IMAGE_DIGEST_8.5-r1 := sha256:08114d91335ed02f9ab0227e470373670a165535fb8e2ac576bdffbec664b92c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
