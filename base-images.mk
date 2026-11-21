# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:3ae619ed51f3b5ae6e3ae34d03f263f9d78985ed53405370e7c876c4061b9fbb
BASE_IMAGE_DIGEST_8.2-r22 := sha256:b3664ca9b95f8da2e82d7ecd2e5e0f25f494e4b597090c8db9bb06749c63d87e
BASE_IMAGE_DIGEST_8.3 := sha256:371356d75032156743639b4fe8dc51cfa20ddff826d6e6f0d4912ba76b5ade5c
BASE_IMAGE_DIGEST_8.3-r22 := sha256:c455b8749732af7c95f644225765b7f7dd55c022452d32aa74927d41db624c35
BASE_IMAGE_DIGEST_8.4 := sha256:9d8de6f0304d05c41dbcc2edba8d883aeafe5b32611a86d850c2923e57ecd157
BASE_IMAGE_DIGEST_8.4-r22 := sha256:7331d394851339e3029605e687fa8934132e4869f787bd2f80ae2c84c4bac907
BASE_IMAGE_DIGEST_8.5 := sha256:767fe2bd4c292af2794fd1b080c797c4b77cee8a11bfcf3a37ace677610476d9
BASE_IMAGE_DIGEST_8.5-r22 := sha256:5c4d93ab66aa64169f6d8aa5a88bc3a1212807c9a73328ecfaa0ed41d7b39fbe

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
