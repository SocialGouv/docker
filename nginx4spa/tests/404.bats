#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker run --rm -p 8888:8080 -d --name socialgouv_docker_nginx4spa ${SG_DOCKER_IMAGE:-'socialgouv_docker_nginx4spa'}
}

teardown_file() {
  docker rm -f socialgouv_docker_nginx4spa
}

@test "nginx4spa: should return 200 and homepage on 404 (SPA client-side routing)" {
  run wget --server-response --output-document - --quiet http://localhost:8888/pouet
  assert_output --partial "HTTP/1.1 200 OK"
  assert_success
}
