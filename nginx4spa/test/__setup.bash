#

load /usr/lib/bats-support/load.bash
load /usr/lib/bats-assert/load.bash

CWD=${CWD:="$(pwd)"}
REGISTRY_IMAGE=${REGISTRY_IMAGE:="registry.localhost/socialgouv/docker"}
IMAGE_TAG=${IMAGE_TAG:="latest"}
