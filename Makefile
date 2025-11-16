# Makefile for 4-bit ALU ASIC Design Flow

# Variables
RTL_DIR = rtl
SIM_DIR = sim
SYNTH_DIR = synth
SCRIPTS_DIR = scripts

# Default target
.PHONY: all
all: help

# Help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  sim        - Run RTL simulation"
	@echo "  synth      - Run synthesis"
	@echo "  pnr        - Run OpenLane place & route"
	@echo "  view       - View layout in KLayout"
	@echo "  reports    - Generate all reports"
	@echo "  clean      - Clean generated files"
	@echo "  help       - Show this help message"

# Simulation
.PHONY: sim
sim:
	@echo "Running simulation..."
	@cd $(SCRIPTS_DIR) && ./run_simulation.sh

# Synthesis
.PHONY: synth
synth:
	@echo "Running synthesis..."
	@cd $(SCRIPTS_DIR) && ./run_synthesis.sh

# Place & Route
.PHONY: pnr
pnr:
	@echo "Running OpenLane flow..."
	@cd $(SCRIPTS_DIR) && ./run_openlane.sh

# View Layout
.PHONY: view
view:
	@echo "Opening layout viewer..."
	@cd $(SCRIPTS_DIR) && ./view_layout.sh

# Generate Reports
.PHONY: reports
reports:
	@echo "Generating reports..."
	@cd $(SCRIPTS_DIR) && python3 generate_reports.py

# Clean
.PHONY: clean
clean:
	@echo "Cleaning generated files..."
	@cd $(SCRIPTS_DIR) && ./cleanup.sh
	@rm -f $(SIM_DIR)/*.vvp $(SIM_DIR)/*.vcd
	@echo "Clean complete!"
