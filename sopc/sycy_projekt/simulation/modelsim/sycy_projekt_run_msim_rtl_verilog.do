transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/singleTeaBlock.v}
vlog -vlog01compat -work work +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/random_generator.v}
vlog -vlog01compat -work work +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/pdfCheckerFsm.v}
vlog -vlog01compat -work work +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/fiveBitToAsciiDecoder.v}
vlog -vlog01compat -work work +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/sycy_projekt.v}
vlib cpu
vmap cpu cpu
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/cpu.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_customins_master_translator.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_pio_1.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_pio_0.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_performance_counter_0.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_onchip_memory2_0.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_nios2_gen2_0.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_nios2_gen2_0_cpu.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_nios2_gen2_0_cpu_debug_slave_sysclk.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_nios2_gen2_0_cpu_debug_slave_tck.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_nios2_gen2_0_cpu_debug_slave_wrapper.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_nios2_gen2_0_cpu_test_bench.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_jtag_uart_0.v}
vlog -vlog01compat -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/hulkFinder.v}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_irq_mapper.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_rsp_mux_001.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_cmd_mux_002.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_cmd_demux_001.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_router_004.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_router_002.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_router_001.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_mm_interconnect_0_router.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_merlin_master_translator.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/altera_customins_slave_translator.sv}
vlog -sv -work cpu +incdir+E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules {E:/Polibuda/SYCY/Sycy_Reference_Model_6-master/sopc/sycy_projekt/cpu/synthesis/submodules/cpu_nios2_gen2_0_custom_instruction_master_multi_xconnect.sv}

