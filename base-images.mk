# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:14fe27d75d036b18f19d74219ac53d39b94cd47da18d9563b13cc0eb5192b51f
BASE_IMAGE_DIGEST_8.2-r5 := sha256:3cd512530f5b258e67e0cbe531ba1e2062f23992eceb70db40e4dfcf85efce55
BASE_IMAGE_DIGEST_8.3 := sha256:538fbabdc8e5bdc638f90e36c7b5d6750514930533c6ace7937e8f1c670d34d8
BASE_IMAGE_DIGEST_8.3-r5 := sha256:bf391242a57f2aad571795866d7e92fe2b0f2f0130ebd87204e438c68cacfa8b
BASE_IMAGE_DIGEST_8.4 := sha256:137b6da695555c9cdae985a9383b90fe28b0883ea65b275fe382fbbdcbcbd90d
BASE_IMAGE_DIGEST_8.4-r5 := sha256:e7e1a7254f3b2f29625bb28e80f5a647f9d7d6643987219e821fabc056010d50
BASE_IMAGE_DIGEST_8.5 := sha256:bb3820824beed4a0a0a16416ea2d1ca60fb6c14390b60655d2032410e9e873eb
BASE_IMAGE_DIGEST_8.5-r5 := sha256:e87b1dfea0b1b2d910adb0cf6593bde7404db2da2f93fdc724bc61d005c21e8c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
