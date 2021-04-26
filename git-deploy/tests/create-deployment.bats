#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  export CI_COMMIT_REF_NAME=foo
  export CI_COMMIT_SHORT_SHA=12345678
  export CI_PROJECT_PATH=SocialGouv/docker
  export GITHUB_TOKEN="gh_token"

  PATH="$( dirname "${BATS_TEST_FILENAME}" )/../bin:$PATH"
}

@test "create-deployment: sends a Deploying SocialGouv/docker@12345678 in staging" {
  export CACHE_RESPONSE="${BATS_RUN_TMPDIR}/deploy_payload.json"

  run create-deployment

  assert_output - <<STDIN
Create deployment:
{
  "auto_merge": false,
  "description": "Deploying SocialGouv/docker@12345678 in staging",
  "environment": "staging",
  "ref": "foo",
  "required_contexts": [],
  "transient_environment": true,
  "production_environment": false
}
STDIN
  assert_success

  assert_file_exist "${CACHE_RESPONSE}"
  assert_file_not_empty "${CACHE_RESPONSE}"

  run cat "${CACHE_RESPONSE}"
  assert_output --partial "message"
}

@test "create-deployment: tags are not transient" {
  export COMMIT_TAG="vX.Y.Z"
  export CACHE_RESPONSE="${BATS_RUN_TMPDIR}/deploy_payload.json"

  run create-deployment

  assert_output - <<STDIN
Create deployment:
{
  "auto_merge": false,
  "description": "Deploying SocialGouv/docker@12345678 in staging",
  "environment": "staging",
  "ref": "vX.Y.Z",
  "required_contexts": [],
  "transient_environment": false,
  "production_environment": false
}
STDIN
  assert_success

  assert_file_exist "${CACHE_RESPONSE}"
  assert_file_not_empty "${CACHE_RESPONSE}"

  run cat "${CACHE_RESPONSE}"
  assert_output --partial "message"
}

@test "create-deployment: send Deploying SocialGouv/docker@12345678 in production" {
  export COMMIT_TAG="vX.Y.Z"
  export PRODUCTION="true"
  export CACHE_RESPONSE="${BATS_RUN_TMPDIR}/deploy_payload.json"

  run create-deployment

  assert_output - <<STDIN
Create deployment:
{
  "auto_merge": false,
  "description": "Deploying SocialGouv/docker@12345678 in production",
  "environment": "production",
  "ref": "vX.Y.Z",
  "required_contexts": [],
  "transient_environment": false,
  "production_environment": true
}
STDIN
  assert_success

  assert_file_exist "${CACHE_RESPONSE}"
  assert_file_not_empty "${CACHE_RESPONSE}"

  run cat "${CACHE_RESPONSE}"
  assert_output --partial "message"
}
