#

DOCKER_COMPOSE = docker-compose
BATS_BIN = $(shell yarn workspace root bin bats)

all: test build lint

lint:
	$(DOCKER_COMPOSE) run --rm lint

build: lint
	$(DOCKER_COMPOSE) build

test: build test_structure

test_structure:
	$(DOCKER_COMPOSE) run --rm test


