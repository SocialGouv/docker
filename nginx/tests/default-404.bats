#!/usr/bin/env bats

load '../../.bats/common.bats.bash'

setup_file() {
  docker run \
    --detach \
    --publish 8888:8080 \
    --rm \
    --volume ${BATS_TEST_DIRNAME}/fixtures-simple:/usr/share/nginx/html \
    --name socialgouv_docker_nginx \
    ${SG_DOCKER_IMAGE:-'socialgouv_docker_nginx'}
}

teardown_file() {
  docker rm -f ${SG_DOCKER_IMAGE:-'socialgouv_docker_nginx'}
}

@test "nginx: should return default SocialGouv 404 page (not a SPA)" {
  run wget --content-on-error --output-document - http://localhost:8888/pouet
  assert_output --partial "Page non trouvée"
}

