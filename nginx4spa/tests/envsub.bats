#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  cp -r ${BATS_TEST_DIRNAME}/fixtures/ ${BATS_RUN_TMPDIR}/www

  docker-compose run \
    --detach \
    -e VERSION=x.y.z \
    --publish 8888:80 \
    --rm \
    --volume ${BATS_RUN_TMPDIR}/www:/usr/share/nginx/html \
    alpine
}

teardown_file() {
  docker-compose rm -sf
}

@test "nginx4spa: should replace the VERSION with x.y.z in index.html" {
  run wget -qO - localhost:8888
  assert_output "nginx4spa/test/index.html with VERSION=x.y.z"
  assert_success
}

@test "nginx4spa: should replace the VERSION with x.y.z in foo/bar/bar.js" {
  run wget -qO - localhost:8888/foo/bar/bar.js
  assert_output "// nginx4spa/test/foo/bar/bar.js with VERSION=x.y.z" ]
  assert_success
}

@test "nginx4spa: should not replace the VERSION with x.y.z in foo/bar/bar.png" {
  run wget -qO - localhost:8888/foo/bar/bar.png
  assert_output "// nginx4spa/test/foo/bar/bar.png with VERSION=%%VERSION%%" ]
  assert_success
}
