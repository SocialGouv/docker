#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  cp -r ${BATS_TEST_DIRNAME}/fixtures-envsubst/ ${BATS_RUN_TMPDIR}/www

  docker-compose run \
    --detach \
    -e VERSION=a.b.c \
    -e SKIP_ENVSUBST=true \
    --publish 8889:80 \
    --rm \
    --volume ${BATS_RUN_TMPDIR}/www:/usr/share/nginx/html \
    alpine
}

teardown_file() {
  docker-compose rm -sf
}

@test "nginx4spa: should NOT replace the VERSION with x.y.z in index.html" {
  run wget -qO - localhost:8889
  assert_output "nginx4spa/test/index.html with VERSION=%%VERSION%%"
  assert_success
}

@test "nginx4spa: should NOT replace the VERSION with x.y.z in foo/bar/bar.js" {
  run wget -qO - localhost:8889/foo/bar/bar.js
  assert_output "// nginx4spa/test/foo/bar/bar.js with VERSION=%%VERSION%%" ]
  assert_success
}


