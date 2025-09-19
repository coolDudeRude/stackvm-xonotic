M4=m4

M4FLAGS=-I src/

SOURCE=src/vm.cfg
OUTPUT=stackvm.cfg

# Use sed to remove unwanted comments and empty space
STRIP=-e '/^\/\/\*/d' # remove lines starting with '//*'
STRIP+=-e '/^$$/d' # remove empty lines, don't need them anyways.

# Enable dynamic programming interface by default.
# As it's also needed by the scripts in examples folder.
ENABLE_DPI=true


ifeq ($(NO_CLOCK),true)
	M4FLAGS+=-DNO_CLOCK
endif

ifeq ($(USE_CPRINT),true)
	M4FLAGS+=-DUSE_CPRINT
endif

ifeq ($(DEBUG_MODE),true)
	M4FLAGS+=-DDEBUG_MODE
endif

ifeq ($(ENABLE_DPI),true)
	M4FLAGS+=-DENABLE_DPI
endif


$(OUTPUT): $(wildcard src/*.cfg)
	$(M4) $(M4FLAGS) $(SOURCE) | sed $(STRIP) > $(OUTPUT)

.PHONY: clean
clean:
	rm $(OUTPUT)

