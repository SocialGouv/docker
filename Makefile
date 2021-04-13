#

CPUS ?= $(shell sysctl -n hw.ncpu || echo 4)
MAKEFLAGS += --jobs=$(CPUS)

#

CACHE_DIR := .cache
CACHE_MAKE_DIR := $(CACHE_DIR)/make

DHALL := env XDG_CACHE_HOME=$(CACHE_DIR) dhall

ASSEMBLY_LINE_DIR := .github/dhall
WORKFLOWS_TARGET_DIR := .github/workflows
IGNORE_DIR := .git

# Make does not offer a recursive wildcard function, so here's one:
# From https://stackoverflow.com/questions/3774568/makefile-issue-smart-way-to-scan-directory-tree-for-c-files
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

# WORKFLOW_SRC=$(wildcard "*/.github/*.workflow.dhall")
PACKAGES_DIR := $(filter-out $(IGNORE_DIR), $(wildcard */))
WORKFLOW_SRC=$(call rwildcard,*/.github/*,.workflow.dhall)
ASSEMBLY_LINE_SRC=$(call rwildcard,$(ASSEMBLY_LINE_DIR)/*,*.dhall)

define freezed_path
$(1:%.dhall=$(CACHE_MAKE_DIR)/%.dhall.freezed)
endef

ASSEMBLY_LINE_FREEZE := $(call freezed_path,${ASSEMBLY_LINE_SRC})

#
#
#

define __dhall_resolve_immediate_dependencies
$(shell \
  $(DHALL) resolve \
		--immediate-dependencies \
		--file ${1} \
	| cut -d" " -f1 \
	| grep -v "^http" \
)
endef

define __relative_path_from_here
$(shell realpath --relative-to=. $(1))
endef

define __nomalize_dhall_dependencies
$(shell realpath -e --relative-to=. "$(dir $(1))$(2)")
endef

define get_dependencies
$(foreach \
	dhall_dependency,
	$(call __dhall_resolve_immediate_dependencies,$(1)), \
	$(call __nomalize_dhall_dependencies,$(1),$(dhall_dependency)) \
)
endef

#
#
#

define __workflow_name
$(firstword $(subst /, ,$(1)))
endef
define __workflow_type
$(basename $(lastword $(subst /, ,$(1))))
endef

define __workflow_src_to_dest
$(WORKFLOWS_TARGET_DIR)$(\
)/$(call __workflow_name,$(1))$(\
).$(call __workflow_type,$(1)).yaml
endef

#
#
#


WORKFLOW_YAML := $(foreach file,$(WORKFLOW_SRC), $(call __workflow_src_to_dest,$(file)))

#
#
#

all: assembly_line workflow
workflow: $(WORKFLOW_YAML)
assembly_line: $(ASSEMBLY_LINE_FREEZE)

#
#
#

define make_github_workflow
$(call __workflow_src_to_dest,$(1)) : $(call freezed_path,$(1)) $(call freezed_path,$(call get_dependencies,$(1)))
	$(DHALL)-to-yaml --file $$< --output $$@
endef

$(foreach file,$(WORKFLOW_SRC),$(eval $(call make_github_workflow,$(file))))

#
#
#

define make_assembly_targets
$(call freezed_path,$(1)) : $(1) $(call freezed_path,$(call get_dependencies,$(1)))
	$(DHALL) freeze --transitive $$<
	$(DHALL) lint --transitive $$<
	$@mkdir -p $$(shell dirname "$$@")
	$(DHALL) hash --file $$< > $$@
endef

$(foreach file,$(WORKFLOW_SRC) $(ASSEMBLY_LINE_SRC),$(eval $(call make_assembly_targets,$(file))))

#
#
#

clean:
	rm -Rf $^

purge: clean
	rm -Rf .cache
