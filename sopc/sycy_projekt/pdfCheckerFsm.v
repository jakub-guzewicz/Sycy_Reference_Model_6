module pdfCheckerFsm(
	input rst,
	input clk,
	input ena,
	input [127:0]givenKey,
	input [63:0]data,
	output [127:0]foundKey,
	output rdy
);
	reg state_reg, state_next;
	reg [127:0]keyReg, nextKeyReg;
	localparam finding = 1'b0, foundState = 1'b1;
	
	
	//State register
	always@(posedge clk or posedge rst)
	begin
		if(rst)
			begin
			state_reg <= finding;
			keyReg <= nextKeyReg;
			end
		else if (ena)
			begin
			state_reg <= state_next;
			keyReg <= nextKeyReg;
			end
	end
	
	//Next state logic
	always@(*)
	begin
		nextKeyReg = givenKey;
		case(state_reg)
			
			finding:	
					begin
						if(data[63:8]=="%PDF-1.")	
							state_next = foundState;
						else 
							state_next = finding;
						//rdy = 1'b0;	
					end
						
			foundState:
					begin
					state_next = finding;
					//rdy = 1'b1;
					end
		endcase
	end
	assign foundKey = keyReg;
	assign rdy = state_next;

endmodule

	