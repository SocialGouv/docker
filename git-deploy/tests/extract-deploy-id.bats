#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  cp -f ./tests/fixtures/deploy_payload.json /tmp/deploy_payload.json
  PATH="$( dirname "${BATS_TEST_FILENAME}" )/../bin:$PATH"
}

@test "extract-deploy-id: extract /tmp/deploy_payload.json output ./DEPLOY_ID" {
  cd "${BATS_RUN_TMPDIR}"
  run extract-deploy-id

  assert_output ""
  assert_success

  assert_file_exist "${BATS_RUN_TMPDIR}/DEPLOY_ID"
  assert_file_not_empty "${BATS_RUN_TMPDIR}/DEPLOY_ID"
  assert_equal $(cat "${BATS_RUN_TMPDIR}/DEPLOY_ID") 123456789
}

@test "extract-deploy-id: fails if no id found" {
  export CACHE_RESPONSE="${BATS_RUN_TMPDIR}/deploy_payload.json"
  echo "{}" > "${CACHE_RESPONSE}"

  cd "${BATS_RUN_TMPDIR}"
  run extract-deploy-id
  assert_failure 1

  assert_file_exist "${BATS_RUN_TMPDIR}/DEPLOY_ID"
  assert_file_not_empty "${BATS_RUN_TMPDIR}/DEPLOY_ID"
}
