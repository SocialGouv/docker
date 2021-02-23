#

load /usr/lib/bats-support/load.bash
load /usr/lib/bats-assert/load.bash

PROJECT_DIR=${PROJECT_DIR:="$(pwd)"}
REGISTRY_IMAGE=${REGISTRY_IMAGE:="registry.localhost/socialgouv/docker"}
IMAGE_TAG=${IMAGE_TAG:="latest"}

if [[ -n $CI ]]; then
  return 0
fi
