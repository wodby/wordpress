# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:574bb42c62d894f8a1beaa3ff812833cb1d672368626806a7e360035b8ac6a0a
BASE_IMAGE_DIGEST_8.2-r5 := sha256:3cd512530f5b258e67e0cbe531ba1e2062f23992eceb70db40e4dfcf85efce55
BASE_IMAGE_DIGEST_8.3 := sha256:9c6343b5ae6c39313f56194091afb1f7cf009b5617f97df0cc529df11fc132eb
BASE_IMAGE_DIGEST_8.3-r5 := sha256:bf391242a57f2aad571795866d7e92fe2b0f2f0130ebd87204e438c68cacfa8b
BASE_IMAGE_DIGEST_8.4 := sha256:6c1018318da0c7c69564115de1ba8d55141c40b005bc3021f3e31a5d5fe4d724
BASE_IMAGE_DIGEST_8.4-r5 := sha256:e7e1a7254f3b2f29625bb28e80f5a647f9d7d6643987219e821fabc056010d50
BASE_IMAGE_DIGEST_8.5 := sha256:a97753f51b3e0de1ee05a36d67df6a33aef297b57d8cc702d8168029874f936e
BASE_IMAGE_DIGEST_8.5-r5 := sha256:e87b1dfea0b1b2d910adb0cf6593bde7404db2da2f93fdc724bc61d005c21e8c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
