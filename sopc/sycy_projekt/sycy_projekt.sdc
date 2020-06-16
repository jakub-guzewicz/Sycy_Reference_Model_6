
## Copyright (C) 2019  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

## DATE    "Mon Feb 17 09:48:40 2020"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************

 
derive_clock_uncertainty

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_pll_clocks -create_base_clocks


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {reset}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {sw[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {sw[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {sw[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {sw[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {sw[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {sw[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {sw[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {sw[7]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {ledr[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {ledr[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {ledr[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {ledr[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {ledr[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {ledr[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {ledr[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {ledr[7]}]

#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

