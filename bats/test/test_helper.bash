#

setup() {
  # export TEST_DEPS_DIR=${TEST_DEPS_DIR:-"/usr/lib"}

  # Load dependencies.
  load '/usr/lib/bats-support/load.bash'
  load '/usr/lib/bats-assert/load.bash'
  load '/usr/lib/bats-file/load.bash'

  # load "${TEST_DEPS_DIR}/bats-support/load.bash"
  # load "${TEST_DEPS_DIR}/bats-assert/load.bash"
  # load "${TEST_DEPS_DIR}/bats-file/load.bash"
}
