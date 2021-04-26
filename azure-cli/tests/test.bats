#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

@test "basic cli access" {
  cd "${BATS_TEST_DIRNAME}/.."
  run docker-compose run alpine --version
  assert_line --partial "azure-cli"
  assert_success
}
