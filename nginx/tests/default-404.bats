#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker-compose run \
    --detach \
    --publish 8888:80 \
    --rm \
    --volume ${BATS_TEST_DIRNAME}/fixtures-simple:/usr/share/nginx/html \
    alpine
}

teardown_file() {
  docker-compose rm -sf
}

@test "nginx: should return default SocialGouv 404 page (not a SPA)" {
  run wget --content-on-error --output-document - http://localhost:8888/pouet
  assert_output --partial "Page non trouvée"
  assert_success
}

