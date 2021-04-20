#

load '../../.bats/common.bats.bash'

#

get_fixtures_root() {
  printf "${BATS_TEST_DIRNAME}/fixtures/$1"
}

#

@test 'get_fixtures_root() <name>: should return the path to the <name> fixtures' {
  run get_fixtures_root "kitchen"
  assert_output "${BATS_TEST_DIRNAME}/fixtures/kitchen"
  assert_success
}

@test 'copy a fiture to a temp folder' {
  teardown() {
    temp_del "$TEST_TEMP_DIR"
  }

  TEST_TEMP_DIR="$(temp_make)"
  TEST_FIXTURE_ROOT=$(get_fixtures_root "kitchen")
  cp -r ${TEST_FIXTURE_ROOT} ${TEST_TEMP_DIR}
  assert_file_exist "${TEST_FIXTURE_ROOT}/fork"
}
