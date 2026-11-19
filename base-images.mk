# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/wordpress-php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:bd58aede6f508bb17c3868a359a5329da30a0533146eec0a53e3e68bcea9c1d7
BASE_IMAGE_DIGEST_8.2-r21 := sha256:9f9ee043f2b3b3c26c5d1ddcc8ca988b1216556430f7c9dcbad36cd373cae776
BASE_IMAGE_DIGEST_8.3 := sha256:e4fe491c52b248bf4df9042dca5bc689abe65141a9b26508b07fe7c728da51e5
BASE_IMAGE_DIGEST_8.3-r21 := sha256:93772afe11d3f33527b0a5492301d5d245578c40d6a9f09600c4c6b3afd784bc
BASE_IMAGE_DIGEST_8.4 := sha256:c2f5faea300176e48413603e0fedf0efecf258bcc198c91b1cfcaf3ff0ccb0b9
BASE_IMAGE_DIGEST_8.4-r21 := sha256:17eaf9292eed6b614c8e6551711682390f41629b3db81c5b051151685be523d4
BASE_IMAGE_DIGEST_8.5 := sha256:6faf204d04d009329c323a725af8afa7aad5dec01005f5b3c1a86fc700beb028
BASE_IMAGE_DIGEST_8.5-r21 := sha256:8af09d8ed8eeadeb9f2d39fd9952fdce73328190b66dbc9068d21d37c2376cd0

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
