module random_generator(
	input  rst,
	input  clk,
	input  ena,
	output [29:0]lfsr_next,
	output period_end
);
	
	reg  [29:0] lfsr_reg;
	// wire [29:0] lfsr_next; 
	wire 		  feedback;
	reg [30:0] counter;
	reg [1:0] period_end_reg;
	assign period_end = period_end_reg;
	

	// State register
	always@(posedge clk or posedge rst) begin
		if (rst) begin
				lfsr_reg <= 30'b1000000000;
				counter <= 31'b0;
			end
		else if (ena) begin
				lfsr_reg <= lfsr_next;
				counter <= counter + 1;
			end
	end
	
	always@(*) begin
		//jezeli doliczy 2^30 -1
		if(counter == 31'd1073741823)
			period_end_reg = 1'b1;
		else
			period_end_reg = 1'b0;
	end
	
	// Maximum length feedback polynomial x30+x29+x26+x24+1, 
	assign feedback = lfsr_reg[29] ^ lfsr_reg[28] ^ lfsr_reg[25] ^ lfsr_reg[24];
	assign lfsr_next = {lfsr_reg[28:0], feedback};
						  
	//assign stream = lfsr_reg[29];

endmodule

