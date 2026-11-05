# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:9d4143e55a460a5dec0a666f89d09ac88cd64e851561d5cb53e06312cf66b7e9
BASE_IMAGE_DIGEST_8.2-r14 := sha256:d068e7f82856e55cb1e9448bbb17c0d8b9d7039e0610c44068373d4bb78591cf
BASE_IMAGE_DIGEST_8.3 := sha256:de715832b4f6a1f2d9e4fe68c71aad4a31ff429d24e4493d73fd6a96907a1a4e
BASE_IMAGE_DIGEST_8.3-r14 := sha256:cbe2aca76f84ea34393a1b5011400ef15d623c4fdcbf044a83a440d353f9c175
BASE_IMAGE_DIGEST_8.4 := sha256:c54cb0cbafa1ffd9e91974ce47bfe6ee5f29a0394dd39c19c0472a5a14156946
BASE_IMAGE_DIGEST_8.4-r14 := sha256:d165335eeac368dbcb1d4432bb22f57bacbd4fa5938f1d411a87ecb01de9e13a
BASE_IMAGE_DIGEST_8.5 := sha256:eb8fb33ae789db6729b6573d236d1cdab986b8975a4984f6f5926276ba1cc73b
BASE_IMAGE_DIGEST_8.5-r14 := sha256:b88255f9dd206220835882fc66a390ef7423d2e60e5666661c22757bcd5560bc

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
