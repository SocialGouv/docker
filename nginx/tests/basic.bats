#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker-compose up -d alpine
}

teardown_file() {
  docker-compose stop
}

@test "nginx: basic nginx should return 'Welcome to nginx!'" {
  run wget -qO - http://localhost:8888/
  assert_output --partial "<title>Welcome to nginx!</title>"
  assert_success
}
