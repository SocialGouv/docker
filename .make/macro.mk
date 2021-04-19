#

# Make does not offer a recursive wildcard function, so here's one:
# From https://stackoverflow.com/questions/3774568/makefile-issue-smart-way-to-scan-directory-tree-for-c-files
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

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

#

define __relative_path_from_here
$(shell realpath --relative-to=. $(1))
endef

#

define __nomalize_dhall_dependencies
$(shell realpath -e --relative-to=. "$(dir $(1))$(2)")
endef

#

define get_dependencies
$(foreach \
	dhall_dependency,
	$(call __dhall_resolve_immediate_dependencies,$(1)), \
	$(call __nomalize_dhall_dependencies,$(1),$(dhall_dependency)) \
)
endef

#

define __workflow_name
$(firstword $(subst /, ,$(1)))
endef

#

define __workflow_type
$(basename $(lastword $(subst /, ,$(1))))
endef

#

define __workflow_src_to_dest
$(WORKFLOWS_TARGET_DIR)$(\
)/$(call __workflow_name,$(1))$(\
).$(call __workflow_type,$(1)).yaml
endef
