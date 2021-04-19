#

CPUS ?= $(shell sysctl -n hw.ncpu || echo 4)
MAKEFLAGS += --jobs=$(CPUS)

#

CACHE_DIR := .cache
CACHE_MAKE_DIR := $(CACHE_DIR)/make
