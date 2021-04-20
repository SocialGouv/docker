#

#

include .make/common.mk
include .make/macro.mk

#

include .make/assembly_line.mk
include .make/workflow.mk

#

include .make/clean.mk


#
#
#

all: assembly_line workflow

#
#
#

.PHONY: azure-cli
azure-cli:
	$(MAKE) -C $@
