#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  export PGHOST="localhost"
  export PGPASSWORD="postgres"
  export PGUSER="postgres"
  export ID="${RANDOM}"

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
  # export NEW_DB_EXTENSIONS="pgcrypto"
  export NEW_DB_NAME="autodevops_${ID}"
  export NEW_PASSWORD="password_${ID}"
  export NEW_USER="user_${ID}"
  #
  run ./bin/create-db-user
  assert_line --partial 'database "autodevops_'${ID}'" does not exist'
  assert_line --partial 'CREATE DATABASE "autodevops_'${ID}'"'
  assert_line --partial 'creating user user_'${ID}' on localhost'
  assert_line --partial 'CREATE USER "user_'${ID}'" WITH PASSWORD'" 'password_${ID}';"
  assert_line --partial 'GRANT USAGE ON SCHEMA public TO "user_'${ID}'";'
  assert_success
}

@test "Verify created autodevops_${ID} database" {
  run psql --list --tuples-only --quiet --no-align
  assert_line --partial "autodevops_${ID}|postgres|UTF8|en_US.utf8|en_US.utf8|=Tc/postgres"
  assert_line --partial "postgres=CTc/postgres"
  assert_line --partial "user_${ID}=CTc/postgres"
  assert_success
}

@test "Verify user_${ID} user" {
  run psql "autodevops_${ID}" --quiet --no-align --tuples-only --command='\du'
  assert_line --partial "user_${ID}||{}"
  assert_success
}

@test "Should do nothing as autodevops_${ID} and user_${ID} already exists" {
  # export NEW_DB_EXTENSIONS="pgcrypto"
  export NEW_DB_NAME="autodevops_${ID}"
  export NEW_PASSWORD="password_${ID}"
  export NEW_USER="user_${ID}"
  #
  run ./bin/create-db-user
  assert_line --partial 'You are now connected to database "autodevops_'${ID}'" as user "postgres".'
  assert_line --partial 'Database already exist, skip'
  assert_success
}
