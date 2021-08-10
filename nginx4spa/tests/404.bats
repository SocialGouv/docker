#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker-compose up -d alpine
}

teardown_file() {
  docker-compose down
}

@test "nginx4spa: should return 200 and homepage on 404 (SPA client-side routing)" {
  run wget --server-response --quiet http://localhost:8888/pouet
  assert_output --partial "HTTP/1.1 200 OK"
  assert_success
}
