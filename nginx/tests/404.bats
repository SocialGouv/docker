#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker-compose up -d alpine
}

teardown_file() {
  docker-compose stop
}

@test "nginx: should return custom 404 (not a SPA)" {
  run wget --server-response --quiet http://localhost:8888/pouet
  assert_output --partial "HTTP/1.1 404 Not Found"
  assert_output --partial "CUSTOM 404 PAGE"
}

