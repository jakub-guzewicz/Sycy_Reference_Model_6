
module cpu (
	clk_clk,
	pio_led_external_connection_export,
	pio_sw_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output	[7:0]	pio_led_external_connection_export;
	input	[7:0]	pio_sw_external_connection_export;
	input		reset_reset_n;
endmodule
