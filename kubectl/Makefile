#

COMPOSE_NAME = socialgouv_docker_kubectl
DOCKER_COMPOSE = COMPOSE_NAME=$(COMPOSE_NAME) docker-compose
BATS_BIN = $$(yarn bin)/bats

all: test build lint

lint:
	$(DOCKER_COMPOSE) run --rm lint

build: lint
	$(DOCKER_COMPOSE) build

test: build test_structure

test_structure:
	$(DOCKER_COMPOSE) run --rm test
