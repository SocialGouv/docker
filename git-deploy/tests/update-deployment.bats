#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  export CI_PROJECT_PATH=SocialGouv/docker
  export GITHUB_TOKEN="gh_token"

  PATH="$( dirname "${BATS_TEST_FILENAME}" )/../bin:$PATH"
}

@test "update-deployment <github_deployment_id> <url> <success|failure>: fails with invalid arguments" {
  run update-deployment 0 1 2

  assert_output --partial "<github_deployment_id> <url> <success|failure>"
  assert_failure 128
}


@test "update-deployment 123456789 https://fabrique.social.gouv.fr success" {
  run update-deployment 123456789 https://fabrique.social.gouv.fr success

  assert_output --partial "message"
  assert_success
}

@test "update-deployment 123456789 https://fabrique.social.gouv.fr failure" {
  run update-deployment 123456789 https://fabrique.social.gouv.fr failure

  assert_output --partial "message"
  assert_success
}
