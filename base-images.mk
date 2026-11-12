# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:a65eb9cebd6c5eaa85b3c5162d3528ccef5c93c07ff2bdc4e084ae872f4f77af
BASE_IMAGE_DIGEST_8.2-r17 := sha256:21183df722ffe902d4b9c9893feab9f0d646add67254c937c7a6f7652d0742fc
BASE_IMAGE_DIGEST_8.3 := sha256:33458b326a12766de76a70d53640c392a81b517b733c36faf44b21ef1616e872
BASE_IMAGE_DIGEST_8.3-r17 := sha256:be10331ca47da0c436d7748ba97182c38ac6b5cc103f3376542d72a450e6b443
BASE_IMAGE_DIGEST_8.4 := sha256:a4a0c595fcac8e7650754dda303880bf0d951efbefca8eac85522ec094bd0c70
BASE_IMAGE_DIGEST_8.4-r17 := sha256:1c466f30283be1254167cad76a5fce82efe1359a7c95dd05e760014503b33baa
BASE_IMAGE_DIGEST_8.5 := sha256:d133d115b865a4d8e3d95f760e63fa19c29cf339899b41671c062935cd02c77c
BASE_IMAGE_DIGEST_8.5-r17 := sha256:01f6b5588833e869e439e2517860cd9acb1082906f8c1e860fb601db6778fa45

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
