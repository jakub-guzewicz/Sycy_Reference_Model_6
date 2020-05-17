module pdfCheckerFsm(
	input rst,
	input clk,
	input ena,
	input [127:0]givenKey,
	input [63:0]data,
	output [127:0]foundKey
);
	reg state_reg, state_next;
	reg [127:0]keyReg;
	localparam finding = 1'b0, foundState = 1'b1;
	
	
	//State register
	always@(posedge clk or posedge rst)
	begin
		if(rst)
			state_reg <= finding;
		else if (ena)
			state_reg <= state_next;
	end
	
	//Next state logic
	always@(*)
		case(state_reg)
			finding:	if(data[63:8]=="%PDF-1.")	
							begin
								state_next = foundState;
								keyReg = givenKey;
							end
						else state_next = finding;
			foundState:	state_next = foundState;
		endcase
	assign foundKey = keyReg;

endmodule

	