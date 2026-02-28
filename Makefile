M4 := m4
SRC_DIR := src
OUTPUT := stackvm.cfg

VM_DEPS := $(shell find $(SRC_DIR) -type f \( -name "*.cfg" -o -name "*.m4" \))

# Options
VM_ENABLE_DPI ?= true
VM_NO_CLOCK   ?= false
VM_USE_CPRINT ?= false
VM_DEBUG_MODE ?= false

M4FLAGS	:= -I $(SRC_DIR)

ifeq ($(VM_ENABLE_DPI),true)
	M4FLAGS += -DENABLE_DPI
endif
ifeq ($(VM_NO_CLOCK),true)
	M4FLAGS += -DNO_CLOCK
endif
ifeq ($(VM_USE_CPRINT),true)
	M4FLAGS += -DUSE_CPRINT
endif
ifeq ($(VM_DEBUG_MODE),true)
	M4FLAGS += -DDEBUG_MODE
endif

# Remove Comments and whitespace.
SED_STRIP := -e '/^\/\/\*/d' -e '/^$$/d'

all: $(OUTPUT) ## Build the virtual machine script (Default)

$(OUTPUT): $(VM_DEPS)
	@echo "Building $@..."
	@$(M4) $(M4FLAGS) $(SRC_DIR)/vm.cfg | sed $(SED_STRIP) > $@
	@echo "Build Complete."

.PHONY: all clean help

clean: ## Remove generated build files
	@echo "Cleaning up..."
	@rm -f $(OUTPUT)

help: ## Show this message
	@echo "Usage: make [target] [VARIABLE=true|false]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Variables (Current Values):"
	@echo "	VM_ENABLE_DPI	= $(VM_ENABLE_DPI)"
	@echo "	VM_NO_CLOCK	= $(VM_NO_CLOCK)"
	@echo "	VM_USE_CPRINT	= $(VM_USE_CPRINT)"
	@echo "	VM_DEBUG_MODE	= $(VM_DEBUG_MODE)"

