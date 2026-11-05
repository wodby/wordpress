# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:ab571d40ce7f023fd1b5f031e406af723c7545914f0ec27a4eb335296a2f989e
BASE_IMAGE_DIGEST_8.2-r15 := sha256:7d60a314befc37b83d02dc179e681a180f99506fbcb868041cfab0d9fce15c9e
BASE_IMAGE_DIGEST_8.3 := sha256:181b0d6c0c34e0cc24233963d50d4093ab3b6a5de72acf8c53f0ab956cf84fa2
BASE_IMAGE_DIGEST_8.3-r15 := sha256:99b0ec33e5b54d08794c10b0e49140342ae0746e8549d3049834e0572e426027
BASE_IMAGE_DIGEST_8.4 := sha256:5b6cf813ab91626919700aa9f15d8a5a2ccc0a88e1df8b93cbb65f923dad4c54
BASE_IMAGE_DIGEST_8.4-r15 := sha256:26bfb1523498a0e343f88a1f19b750b2fed5fe05247350d491f8afc1c50dc25e
BASE_IMAGE_DIGEST_8.5 := sha256:186558bfd67dd1af8d036a7b86a1659b0b1313b18b1138e57926dc335d78f3f5
BASE_IMAGE_DIGEST_8.5-r15 := sha256:aae3cff21a6675b1bfda53995ad991b2436afa4db8ca3c755886a712ea8a52c8

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
