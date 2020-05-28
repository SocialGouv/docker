#

load /usr/lib/bats-support/load.bash
load /usr/lib/bats-assert/load.bash

PROJECT_DIR=${CI_PROJECT_DIR:="$(pwd)"}
REGISTRY_IMAGE=${CI_REGISTRY_IMAGE:="registry.localhost/socialgouv/docker"}
IMAGE_TAG=${CI_COMMIT_SHA:="latest"}

if [[ -n $CI ]]; then
  return 0
fi

# echo "Run"
# echo "docker build nginx4spa -t ${REGISTRY_IMAGE}/nginx4spa:${IMAGE_TAG}"
# echo "docker build nginx4spa -t registry.localhost/socialgouv/docker/nginx4spa:latest"
# echo ""
