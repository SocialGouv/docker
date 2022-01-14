#

DOCKER_COMPOSE = docker-compose

all: test build lint

lint:
	$(DOCKER_COMPOSE) run --rm lint

build: lint
	$(DOCKER_COMPOSE) build

test: build test_structure

test_structure:
	$(DOCKER_COMPOSE) run --rm test

