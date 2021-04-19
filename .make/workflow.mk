
WORKFLOW_SRC=$(call rwildcard,*/.github/*,.workflow.dhall)
WORKFLOW_YAML := $(foreach file,$(WORKFLOW_SRC), $(call __workflow_src_to_dest,$(file)))

#
#
#

workflow: $(WORKFLOW_YAML)

#
#
#

define make_github_workflow
$(call __workflow_src_to_dest,$(1)) : $(call freezed_path,$(1)) $(call freezed_path,$(call get_dependencies,$(1)))
	$(DHALL)-to-yaml --file $$< --output $$@
endef

$(foreach file,$(WORKFLOW_SRC),$(eval $(call make_github_workflow,$(file))))
