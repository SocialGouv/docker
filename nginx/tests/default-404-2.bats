#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker-compose run \
    --detach \
    --publish 8888:8080 \
    --rm \
    --volume ${BATS_TEST_DIRNAME}/fixtures-404:/usr/share/nginx/html \
    alpine
}

teardown_file() {
  docker-compose rm -sf
}

@test "nginx: should return 404 page for next.js exports (not a SPA)" {
  run wget --content-on-error --output-document - http://localhost:8888/pouet
  assert_output --partial "CUSTOM 404 PAGE"
}

