#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker run \
    --detach \
    --publish 8888:8080 \
    --rm \
    --volume ${BATS_TEST_DIRNAME}/fixtures:/usr/share/nginx/html \
    --name socialgouv_docker_nginx4spa \
    ${SG_DOCKER_IMAGE:-'socialgouv_docker_nginx4spa'}
}

teardown_file() {
  docker rm -f socialgouv_docker_nginx4spa
}

@test "nginx4spa: with --volume should return 'nginx'" {
  run wget -qO - localhost:8888
  assert_output "nginx4spa/test/index.html with VERSION=%%VERSION%%"
  assert_success
}
