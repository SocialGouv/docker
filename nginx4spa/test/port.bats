#!/usr/bin/env bats

load __setup

setup() {
  docker run \
    --detach \
    --env PORT=90 \
    --name nginx4spa_test \
    --publish 8888:90 \
    --rm \
    ${REGISTRY_IMAGE}/nginx4spa:${IMAGE_TAG}
}

teardown() {
  docker stop nginx4spa_test
}

@test "should be able to change the port" {
  run wget -qO - localhost:8888
  assert_line --partial --index 3 "Welcome to nginx!"
  assert_success
}
