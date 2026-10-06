# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:ce8edd223f7a2dec017912a033cf40dba14b41de45ea973f30d85e96fadfaf65
BASE_IMAGE_DIGEST_8.2-r8 := sha256:80a43c817a9a7d0aec7416bdcb1ce7de6b537a8b63b8abe22c620be8cbf44123
BASE_IMAGE_DIGEST_8.3 := sha256:187ec3786684b524022575a6dfb7fbd51f7d6da1895077d1295b67cc91eb4715
BASE_IMAGE_DIGEST_8.3-r8 := sha256:fb36ad5a5a2a1f3abecc7be233a6b80c618bc8233c5133beeade6a5239c8b142
BASE_IMAGE_DIGEST_8.4 := sha256:c0bf0664e1a40903f4a6c0ba76729dc2306ccce94524f0d4736a32ae76c1d54b
BASE_IMAGE_DIGEST_8.4-r8 := sha256:2813552af4b455a2a65d718b4d70f84f6393a2deefc789ae5164ef850b9e9f70
BASE_IMAGE_DIGEST_8.5 := sha256:519fcff273b8a804a73ec9949bdcd7c7565017c1c4e65c496003acf5480ef98d
BASE_IMAGE_DIGEST_8.5-r8 := sha256:ca54135366345b4155fc12d07657e7f3c252bee9fd91d4874943174fb4bb579f

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
