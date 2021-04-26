#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  export EXPORT_FROM_K8S_SECRET_ENV=testing
}

export_from_k8s_secret_my-secret() {
  export_from_k8s_secret \
  < ./tests/setup_dir/fixtures/secret.json \
  > "${BATS_RUN_TMPDIR}/secret"
}

@test "export_from_k8s_secret < setup_dir/fixtures/secret.json" {
  \. ./bin/export_from_k8s_secret

  run export_from_k8s_secret_my-secret
  assert_success

  source "${BATS_RUN_TMPDIR}/secret"
  assert_equal "$BAR" "bar value"
  assert_equal "$FOO" "foo value"
  assert_equal "$PASSWORD" "bad\`!(){]|-_$^*@string"
  assert_success
}
