#!/usr/bin/env bats

load __setup

setup() {
  cp -r ${BATS_TEST_DIRNAME}/fixtures/ ${BATS_TMPDIR}/.tmp

  docker run \
    --detach \
    --env VERSION=x.y.z \
    --name nginx4spa_test \
    --publish 8888:80 \
    --rm \
    --volume ${BATS_TMPDIR}/.tmp:/usr/share/nginx/html \
    ${REGISTRY_IMAGE}/nginx4spa:${IMAGE_TAG}
}

teardown() {
  rm -rf ${BATS_TMPDIR}/.tmp
  docker stop nginx4spa_test
}

@test "should replace the VERSION with x.y.z in index.html" {
  run wget -qO - localhost:8888
  assert_output "nginx4spa/test/index.html with VERSION=x.y.z"
  assert_success
}

@test "should replace the VERSION with x.y.z in foo/bar/bar.js" {
  run wget -qO - localhost:8888/foo/bar/bar.js
  assert_output "// nginx4spa/test/foo/bar/bar.js with VERSION=x.y.z" ]
  assert_success
}
