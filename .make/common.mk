#

CPUS ?= 4
MAKEFLAGS += --jobs=$(CPUS)

#

CACHE_DIR := .cache
CACHE_MAKE_DIR := ${CACHE_DIR}/make

#

DHALL := env XDG_CACHE_HOME=${CACHE_DIR} dhall
