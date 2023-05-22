#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker run -p 8888:8080 -d --rm --name socialgouv_docker_nginx4spa ${SG_DOCKER_IMAGE:-'socialgouv_docker_nginx4spa'}
}

teardown_file() {
  docker rm -f socialgouv_docker_nginx4spa
}

@test "nginx4spa: basic nginx should return 'Welcome to nginx!'" {
  run wget -qO - http://localhost:8888/
  assert_output --partial "<title>Welcome to nginx!</title>"
  assert_success
}
