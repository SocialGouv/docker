#
#
#

.SUFFIXES:
.PHONY: Makefile all workflow assembly_line
all: workflow assembly_line


#

include .make/common.mk
include .make/macro.mk

#

include .make/assembly_line.mk
include .make/workflow.mk

#

include .make/clean.mk
