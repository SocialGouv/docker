#

ASSEMBLY_LINE_DIR := .github/dhall
WORKFLOWS_TARGET_DIR := .github/workflows
IGNORE_DIR := .git

PACKAGES_DIR := $(filter-out $(IGNORE_DIR), $(wildcard */))
ASSEMBLY_LINE_SRC=$(call rwildcard,$(ASSEMBLY_LINE_DIR)/*,*.dhall)

define freezed_path
$(1:%.dhall=$(CACHE_MAKE_DIR)/%.dhall.freezed)
endef

ASSEMBLY_LINE_FREEZE := $(call freezed_path,${ASSEMBLY_LINE_SRC})


#
#
#

.PHONY: assembly_line
assembly_line: $(ASSEMBLY_LINE_FREEZE)

#
#
#

define make_assembly_targets
$(call freezed_path,$(1)) : $(1) $(call freezed_path,$(call get_dependencies,$(1)))
	$(DHALL) freeze --all --inplace $$<
	$(DHALL) lint --inplace $$<
	$@mkdir -p $$(shell dirname "$$@")
	$(DHALL) hash --file $$< > $$@
endef

$(foreach file,$(WORKFLOW_SRC) $(ASSEMBLY_LINE_SRC),$(eval $(call make_assembly_targets,$(file))))
