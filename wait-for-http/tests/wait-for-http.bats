#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  export WAIT_FOR_INTERVAL="0.5s"
  export WAIT_FOR_RETRIES="1"
  PATH="$( dirname "${BATS_TEST_FILENAME}" )/../bin:$PATH"
}

@test "wait-for-http <target>: fails with no target" {
  run wait-for-http
  assert_line --index 0 "Invalid URL : "
  assert_line --index 1 "usage: wait-for-http http://app.url"
  assert_failure 1
}

@test "wait-for-http <target>: wait-for-http http://invalid" {
  run wait-for-http http://invalid
  assert_line --index 0 "curl: (6) Could not resolve host: invalid"
  assert_line --index 1 "Waiting for http://invalid... (0)"
  assert_line --index 2 "curl: (6) Could not resolve host: invalid"
  assert_failure 128
}

@test "wait-for-http <target>: wait-for-http https://www.githubstatus.com/api/v2/status.json" {
  run wait-for-http https://www.githubstatus.com/api/v2/status.json
  assert_output --partial "GitHub"
  assert_output --partial "status"
  assert_success
}
