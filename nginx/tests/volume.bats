#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker run \
    --detach \
    --publish 8888:8080 \
    --rm \
    --volume ${BATS_TEST_DIRNAME}/fixtures:/usr/share/nginx/html \
    --name socialgouv_docker_nginx \
    socialgouv_docker_nginx
}

teardown_file() {
  docker rm -f socialgouv_docker_nginx
}

@test "nginx: with --volume should return 'nginx'" {
  run wget -qO - localhost:8888
  assert_output "nginx/test/index.html with VERSION=%%VERSION%%"
  assert_success
}
