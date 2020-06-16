module sycy_projekt
(
	input clk, reset,
	input [7:0] sw,
	output [7:0] ledr
);


cpu u0 (
	.clk_clk                             (clk),  //  clk.clk
	.reset_reset_n                       (reset), // reset.reset_n
	.pio_sw_external_connection_export (sw), // pio_ledr_external_connection.export
	.pio_led_external_connection_export   (ledr)    // pio_sw_external_connection.export
);
	
endmodule 
