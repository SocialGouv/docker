#

DOCKER_COMPOSE = docker-compose
BATS_BIN = $(shell yarn workspace root bin bats)

all: build lint

lint:
	$(DOCKER_COMPOSE) run --rm lint

build: lint
	$(DOCKER_COMPOSE) build

# test: build test_structure e2e

# test_structure:
# 	$(DOCKER_COMPOSE) run --rm test

# e2e:
# 	$(BATS_BIN) tests/*.bats

