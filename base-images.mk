# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:bd58aede6f508bb17c3868a359a5329da30a0533146eec0a53e3e68bcea9c1d7
BASE_IMAGE_DIGEST_8.2-r20 := sha256:2755f8d247bd686ed4071fc081f04678729be510e032b3bb03590686d7ed8ea7
BASE_IMAGE_DIGEST_8.3 := sha256:e4fe491c52b248bf4df9042dca5bc689abe65141a9b26508b07fe7c728da51e5
BASE_IMAGE_DIGEST_8.3-r20 := sha256:20d74fdb7c2404b4f51c56fb3a576660fadb9070459f6831b19e1e3d2c6b2642
BASE_IMAGE_DIGEST_8.4 := sha256:c2f5faea300176e48413603e0fedf0efecf258bcc198c91b1cfcaf3ff0ccb0b9
BASE_IMAGE_DIGEST_8.4-r20 := sha256:fd4641b2064eae7f235b704f919042cab43e49ec50ffe6ade461a0c8887cee61
BASE_IMAGE_DIGEST_8.5 := sha256:6faf204d04d009329c323a725af8afa7aad5dec01005f5b3c1a86fc700beb028
BASE_IMAGE_DIGEST_8.5-r20 := sha256:24cc3841761f710f4e740145f2d0430beec2ce44103b17d3e6af6130a90c7f46

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
