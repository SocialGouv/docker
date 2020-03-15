#!/usr/bin/env bats

load __setup

setup() {
  docker run \
    --detach \
    --name nginx4spa_test \
    --publish 8888:80 \
    --rm \
    ${REGISTRY_IMAGE}/nginx4spa:${IMAGE_TAG}
}

teardown() {
  docker stop nginx4spa_test
}

@test "basic nginx should return 'Welcome to nginx!'" {
  run wget -qO - localhost:8888
  assert_line --partial --index 3 "Welcome to nginx!"
  assert_success
}
