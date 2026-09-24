# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:574bb42c62d894f8a1beaa3ff812833cb1d672368626806a7e360035b8ac6a0a
BASE_IMAGE_DIGEST_8.2-r3 := sha256:65ff2e22679de12d7607f4ead2591b4b45763eeb2983e70f88db33d30c1de215
BASE_IMAGE_DIGEST_8.3 := sha256:9c6343b5ae6c39313f56194091afb1f7cf009b5617f97df0cc529df11fc132eb
BASE_IMAGE_DIGEST_8.3-r3 := sha256:a770aaf1b756f2bd2e0d0970184119c10ce5576eda21d75dc4fb335fbe5321a8
BASE_IMAGE_DIGEST_8.4 := sha256:6c1018318da0c7c69564115de1ba8d55141c40b005bc3021f3e31a5d5fe4d724
BASE_IMAGE_DIGEST_8.4-r3 := sha256:aaf330a8499e08f3b42ac7f9edf85b086e5e33355847ba6109fde0adc485ae1e
BASE_IMAGE_DIGEST_8.5 := sha256:a97753f51b3e0de1ee05a36d67df6a33aef297b57d8cc702d8168029874f936e
BASE_IMAGE_DIGEST_8.5-r3 := sha256:9961803a3164779623edd5cda5ed41151a886e84461b1316cdb8becdd8478faa

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
