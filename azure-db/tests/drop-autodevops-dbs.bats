#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  export PGHOST="localhost"
  export PGPASSWORD="postgres"
  export PGUSER="postgres"
  export ID_1="${RANDOM}"
  export ID_2="${RANDOM}"

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

@test "Create autodevops_${ID_1} db and user_${ID_1}" {
  export NEW_DB_NAME="autodevops_${ID_1}"
  export NEW_PASSWORD="password_${ID_1}"
  export NEW_USER="user_${ID_1}"
  run ./bin/create-db-user
  assert_success
}

@test "Create autodevops_${ID_2} db and user_${ID_2}" {
  export NEW_DB_NAME="autodevops_${ID_2}"
  export NEW_PASSWORD="password_${ID_2}"
  export NEW_USER="user_${ID_2}"
  run ./bin/create-db-user
  assert_success
}

@test "Drop all autodevops_* and user_*" {
  run ./bin/drop-autodevops-dbs
  #
  assert_line --partial 'SET SESSION CHARACTERISTICS AS TRANSACTION READ WRITE;'
  assert_line --partial 'SELECT pg_terminate_backend (pg_stat_activity.pid)'
  assert_success
}

@test "Verify drop autodevops_${ID_1} database" {
  run psql --list --tuples-only --quiet --no-align
  refute_line --partial "autodevops_${ID_1}|postgres|UTF8|en_US.utf8|en_US.utf8|=Tc/postgres"
  refute_line --partial "user_${ID_1}=CTc/postgres"
  assert_success
}

@test "Verify drop autodevops_${ID_2} database" {
  run psql --list --tuples-only --quiet --no-align
  refute_line --partial "autodevops_${ID_2}|postgres|UTF8|en_US.utf8|en_US.utf8|=Tc/postgres"
  refute_line --partial "user_${ID_2}=CTc/postgres"
  assert_success
}
