# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:28b26f19f426998f0e3bf093425c4d7463ec9de181f675a6648d2f398d9bf35d
BASE_IMAGE_DIGEST_8.2-r22 := sha256:b3664ca9b95f8da2e82d7ecd2e5e0f25f494e4b597090c8db9bb06749c63d87e
BASE_IMAGE_DIGEST_8.3 := sha256:4db8cadfd8adaedee17ff1a4f25f8d504b0d40796d4061c391f4e343cff5d169
BASE_IMAGE_DIGEST_8.3-r22 := sha256:c455b8749732af7c95f644225765b7f7dd55c022452d32aa74927d41db624c35
BASE_IMAGE_DIGEST_8.4 := sha256:bca7aaa017f9a49fddb032e7016186ca2af643afa4e47716946be2db7bd54fb1
BASE_IMAGE_DIGEST_8.4-r22 := sha256:7331d394851339e3029605e687fa8934132e4869f787bd2f80ae2c84c4bac907
BASE_IMAGE_DIGEST_8.5 := sha256:65959e5ae7e6bbd3464af2f1e9c998c6e1ec795754791f897ff404f677bcb0b9
BASE_IMAGE_DIGEST_8.5-r22 := sha256:5c4d93ab66aa64169f6d8aa5a88bc3a1212807c9a73328ecfaa0ed41d7b39fbe

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
