###############################################################################
# Created by write_sdc
# Sun Nov 16 04:02:45 2025
###############################################################################
current_design alu4bit
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {sel[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {sel[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {sel[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[3]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {result[3]}]
set_load -pin_load 0.0334 [get_ports {result[2]}]
set_load -pin_load 0.0334 [get_ports {result[1]}]
set_load -pin_load 0.0334 [get_ports {result[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sel[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sel[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sel[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
