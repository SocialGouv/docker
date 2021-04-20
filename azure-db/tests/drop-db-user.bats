#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  export PGHOST=${PGHOST="localhost"}
  export PGPASSWORD="postgres"
  export PGUSER="postgres"
  export ID="${RANDOM}"

  docker-compose up -d postgres
}

teardown_file() {
  docker-compose stop
}

@test "Wait for postgres" {
  run timeout 60s bash -c "until pg_isready -h ${PGHOST}; do sleep 1 ; done"
  assert_line 'localhost:5432 - accepting connections'
  assert_success
}

@test "Create autodevops_${ID} db and user_${ID}" {
  export NEW_DB_NAME="autodevops_${ID}"
  export NEW_PASSWORD="password_${ID}"
  export NEW_USER="user_${ID}"
  run ./bin/create-db-user
  assert_success
}

@test "Drop autodevops_${ID} db and user_${ID}" {
  export DROP_DATABASE="autodevops_${ID}"
  export DROP_USER="user_${ID}"
  #
  run ./bin/drop-db-user
  assert_line --partial 'disconnect activities on database autodevops_'${ID}' on localhost'
  assert_line --partial 'SET SESSION CHARACTERISTICS AS TRANSACTION READ WRITE;'
  assert_line --partial 'SELECT pg_terminate_backend (pg_stat_activity.pid)'
  assert_line --partial 'deleting database autodevops_'${ID}' on localhost'
  assert_success
}

@test "Verify drop autodevops_${ID} database" {
  run psql --list --tuples-only --quiet --no-align
  refute_line --partial "autodevops_${ID}|postgres|UTF8|en_US.utf8|en_US.utf8|=Tc/postgres"
  refute_line --partial "user_${ID}=CTc/postgres"
  assert_success
}
