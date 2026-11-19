# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:f11f48b9541ecd2df0b287111a26c7bf8160b51ef1ceec4071f9cac243c4ac1f
BASE_IMAGE_DIGEST_8.2-r21 := sha256:9f9ee043f2b3b3c26c5d1ddcc8ca988b1216556430f7c9dcbad36cd373cae776
BASE_IMAGE_DIGEST_8.3 := sha256:4d7c8b071502f5c8300f980eb17bc6ca4dbdb64155d1b6bccbac5e8bab9f7559
BASE_IMAGE_DIGEST_8.3-r21 := sha256:93772afe11d3f33527b0a5492301d5d245578c40d6a9f09600c4c6b3afd784bc
BASE_IMAGE_DIGEST_8.4 := sha256:adc0cbf377f90758ea7dae05b733adcc9244be72754601db6802056213940f8b
BASE_IMAGE_DIGEST_8.4-r21 := sha256:17eaf9292eed6b614c8e6551711682390f41629b3db81c5b051151685be523d4
BASE_IMAGE_DIGEST_8.5 := sha256:a07aa0140d10e2041c8c408af0187929006e389b3e019d110f0ee1feaf18ebae
BASE_IMAGE_DIGEST_8.5-r21 := sha256:8af09d8ed8eeadeb9f2d39fd9952fdce73328190b66dbc9068d21d37c2376cd0

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
