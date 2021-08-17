#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker-compose run \
    --detach \
    --publish 8888:80 \
    --rm \
    --volume ${BATS_TEST_DIRNAME}/fixtures:/usr/share/nginx/html \
    alpine
}

teardown_file() {
  docker-compose rm -sf
}

@test "nginx: with --volume should return 'nginx'" {
  run wget -qO - localhost:8888
  assert_output "nginx/test/index.html with VERSION=%%VERSION%%"
  assert_success
}
