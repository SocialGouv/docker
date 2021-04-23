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

  docker-compose up -d postgres
}

teardown_file() {
  docker-compose stop
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

  assert_output - <<STDIN
psql: error: could not translate host name "unknow_host" to address: Name or service not known

⏳ Waiting for Postgres to go Green (0 left)



PGHOST: unknow_host
PGDATABASE: postgres
PGUSER: postgres

psql: error: could not translate host name "unknow_host" to address: Name or service not known

😓 Cannot connect to the Postgres server

PGHOST: unknow_host
PGDATABASE: postgres
PGUSER: postgres
STDIN
  assert_failure 2
}

