#

common::setup() {
  load "${BATS_ROOT}/../bats-support/load.bash"
  load "${BATS_ROOT}/../bats-assert/load.bash"

  # NODE(douglasduteil): manual bail mode
  [ ! -f "${BATS_PARENT_TMPNAME}.skip" ] || skip "skip remaining tests"
}


common::teardown() {
  # NODE(douglasduteil): manual bail mode
  [ -n "$BATS_TEST_COMPLETED" ] || touch "${BATS_PARENT_TMPNAME}.skip"
}

#

setup() {
  common::setup
}

teardown() {
  common::teardown
}
