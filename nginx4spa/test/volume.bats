#!/usr/bin/env bats

load __setup

setup() {
  docker run \
    --detach \
    --name nginx4spa_test \
    --publish 8888:80 \
    --rm \
    --volume ${CWD}/nginx4spa/test/fixtures:/usr/share/nginx/html \
    ${REGISTRY_IMAGE}/nginx4spa:${IMAGE_TAG}
}

teardown() {
  docker stop nginx4spa_test
}

@test "with --volume should return 'nginx'" {
  run wget -qO - localhost:8888
  assert_output "nginx4spa/test/index.html with VERSION=%%VERSION%%"
  assert_success
}
