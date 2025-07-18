# Get the directory where this Makefile is located
MAKEFILE_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
# Set the project path relative to the Makefile directory
PROJECT_PATH ?= $(MAKEFILE_DIR)kicad/closed-drybox.kicad_pro

# Find KiCad executable depending on MacOS or Linux
KICAD_PATH ?= $(shell if [ "$$(uname)" = "Darwin" ]; then echo "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad"; else which kicad; fi)

# Default target
.PHONY: edit

# Open KiCad project
edit:
	$(KICAD_PATH) $(PROJECT_PATH) &

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	@rm -rf "$(MAKEFILE_DIR)kicad/jlcpcb/"
	@echo "✓ Cleanup completed"
