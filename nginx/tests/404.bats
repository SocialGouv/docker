#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker-compose run \
    --detach \
    --publish 8889:8080 \
    --rm \
    --volume ${BATS_TEST_DIRNAME}/fixtures:/usr/share/nginx/html \
    alpine
}

teardown_file() {
  docker-compose rm -sf
}

@test "nginx: should return status 404 (not a SPA)" {
  run wget --server-response --quiet http://localhost:8889/pouet
  assert_output --partial "HTTP/1.1 404 Not Found"
}

@test "nginx: should return custom 404 page (not a SPA)" {
  run wget --content-on-error --output-document - http://localhost:8889/pouet
  assert_output --partial "CUSTOM 404 PAGE"
}

