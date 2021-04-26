#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  export PGHOST="localhost"
  export PGPASSWORD="postgres"
  export PGUSER="postgres"
  export ID="${RANDOM}"

  export NEW_DB_NAME="autodevops_${ID}"
  export NEW_PASSWORD="password_${ID}"
  export NEW_USER="user_${ID}"
  export NEW_DB_EXTENSIONS="pgcrypto"

  docker-compose up -d postgres
}

teardown_file() {
  ./bin/drop-autodevops-dbs
  docker-compose stop
}

@test "Wait for postgres" {
  run timeout 60s bash -c "until pg_isready -h ${PGHOST}; do sleep 1 ; done"
  assert_line 'localhost:5432 - accepting connections'
  assert_success
}

@test "Create autodevops_${ID} db and user_${ID}" {
  run ./bin/create-db-user
  assert_success
}

@test "Start hasura server on the autodevops_${ID} database" {
  export HASURA_GRAPHQL_DATABASE_URL="postgres://${NEW_USER}:${NEW_PASSWORD}@postgres:5432/${NEW_DB_NAME}"
  run docker-compose up -d hasura
  assert_success
}

@test "Wait for hasura to be green" {
  run wget -qO- localhost:8080/healthz
  assert_line 'OK'
  assert_success
}
