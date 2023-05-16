#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker run --rm -d -p 8888:8080 --name socialgouv_docker_nginx ${SG_DOCKER_IMAGE:-'socialgouv_docker_nginx'}
}

teardown_file() {
  docker rm -f ${SG_DOCKER_IMAGE:-'socialgouv_docker_nginx'}
}

@test "nginx: basic nginx should return 'Welcome to nginx!'" {
  run wget -qO - http://localhost:8888/
  assert_output --partial "<title>Welcome to nginx!</title>"
  assert_success
}
