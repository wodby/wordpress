# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:ab571d40ce7f023fd1b5f031e406af723c7545914f0ec27a4eb335296a2f989e
BASE_IMAGE_DIGEST_8.2-r16 := sha256:20472c53c149fc2365eea2c2cddf040e0c99f94c8f42300ad1c1a8b831721ae1
BASE_IMAGE_DIGEST_8.3 := sha256:181b0d6c0c34e0cc24233963d50d4093ab3b6a5de72acf8c53f0ab956cf84fa2
BASE_IMAGE_DIGEST_8.3-r16 := sha256:6f680e62ea9f95bbce8d0efc4436cff4dca6c94131d8bd8ef96589dbf098695e
BASE_IMAGE_DIGEST_8.4 := sha256:5b6cf813ab91626919700aa9f15d8a5a2ccc0a88e1df8b93cbb65f923dad4c54
BASE_IMAGE_DIGEST_8.4-r16 := sha256:5b6cf813ab91626919700aa9f15d8a5a2ccc0a88e1df8b93cbb65f923dad4c54
BASE_IMAGE_DIGEST_8.5 := sha256:186558bfd67dd1af8d036a7b86a1659b0b1313b18b1138e57926dc335d78f3f5
BASE_IMAGE_DIGEST_8.5-r16 := sha256:74df30233014114bb484b51e43fd17e2967d415323b5a14adc21ccf4e64ab318

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
