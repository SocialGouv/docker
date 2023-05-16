#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  export PGHOST="localhost"
  export PGPASSWORD="postgres"
  export PGDATABASE="postgres"
  export PGUSER="postgres"

  export WAIT_FOR_INTERVAL="0.5s"
  export WAIT_FOR_RETRIES="1"
  PATH="$( dirname "${BATS_TEST_FILENAME}" )/../bin:$PATH"

  docker run --rm -p 5432:5432 -d -e POSTGRES_PASSWORD=postgres --name socialgouv_docker_wait-for-postgres_postgres postgres:11-alpine
}

teardown_file() {
  docker rm -f ${SG_DOCKER_IMAGE:-'socialgouv_docker_wait-for-postgres_postgres'}
}

@test "wait-for-postgres: ensure that a pg is ready" {
  run timeout 60s bash -c "until pg_isready -h ${PGHOST}; do sleep 1 ; done"
  assert_line 'localhost:5432 - accepting connections'
  assert_success
}

@test "wait-for-postgres: wait for postgres" {
  run wait-for-postgres
  assert_output ""
  assert_success
}

@test "wait-for-postgres: fails with unknow host" {
  export PGHOST="unknow_host"
  run wait-for-postgres

  assert_output --partial 'psql: error: could not translate host name "unknow_host" to address'
  assert_output --partial "⏳ Waiting for Postgres to go Green (0 left)"
  assert_output --partial "😓 Cannot connect to the Postgres server"
  assert_output --partial "PGHOST: unknow_host"
  assert_output --partial "PGDATABASE: postgres"
  assert_output --partial "PGUSER: postgres"
  assert_failure 2
}

