
WORKFLOW_SRC=$(call rwildcard,*/.github/*,.workflow.dhall)
WORKFLOW_DHALL=$(call rwildcard,*/.github/*,.dhall)
WORKFLOW_YAML := $(foreach file,$(WORKFLOW_SRC), $(call __workflow_src_to_dest,$(file)))

#
#
#

.PHONY: workflow
workflow: $(WORKFLOW_YAML)

#
#
#

define make_github_workflow_freeze
$(call freezed_path,$(1)) : $(1) $(call freezed_path,$(call get_dependencies,$(1)))
	$(DHALL) freeze --all $$<
	$(DHALL) format $$<
	$(DHALL) lint $$<
	$@mkdir -p $$(shell dirname "$$@")
	$(DHALL) hash --file $$< > $$@
endef
$(foreach file,$(WORKFLOW_DHALL),$(eval $(call make_github_workflow_freeze,$(file))))

define make_github_workflow
$(call __workflow_src_to_dest,$(1)): $(1) $(call freezed_path,$(1)) $(call freezed_path,$(call get_dependencies,$(1)))
	$@mkdir -p $$(shell dirname "$$@")
	$(DHALL)-to-yaml --file $$< --output $$@
endef

$(foreach file,$(WORKFLOW_SRC),$(eval $(call make_github_workflow,$(file))))
