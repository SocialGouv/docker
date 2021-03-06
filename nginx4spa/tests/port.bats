#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker-compose run \
    --detach \
    -e PORT=90 \
    --publish 8888:90 \
    --rm \
    alpine
}

teardown_file() {
  docker-compose rm -sf
}

@test "nginx4spa: should be able to change the port" {
  run wget -qO - localhost:8888
  assert_line --partial --index 3 "Welcome to nginx!"
  assert_success
}
