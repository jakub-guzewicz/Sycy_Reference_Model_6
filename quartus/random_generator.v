module random_generator(
	input  rst,
	input  clk,
	input  ena,
	output [29:0]lfsr_next	
);
	
	reg  [29:0] lfsr_reg;
	// wire [29:0] lfsr_next; 
	wire 		  feedback;

	// State register
	always@(posedge clk or posedge rst) begin
		if (rst) 
			lfsr_reg <= 30'b1000000000;
		else if (ena)
			lfsr_reg <= lfsr_next;
	end
	// Maximum length feedback polynomial x30+x29+x26+x24+1, 
	assign feedback = lfsr_reg[29] ^ lfsr_reg[28] ^ lfsr_reg[25] ^ lfsr_reg[24];
	assign lfsr_next = {lfsr_reg[28:0], feedback};
						  
	//assign stream = lfsr_reg[29];

endmodule

