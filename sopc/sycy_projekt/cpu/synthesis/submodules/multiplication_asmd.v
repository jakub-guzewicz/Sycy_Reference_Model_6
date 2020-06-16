module multiplication_asmd
#(
	parameter N = 16
)
(
	input  	   	  	 	 rst,
	input  			  	 clk,
	input  			  	 ena,
	input  			  	 start,
	input  	  [2*N-1:0] dataA,
	input  	  [2*N-1:0] dataB,
	output reg [2*N-1:0] res,
	output reg 		    rdy
);
								 
	localparam SIZE = 2;
	localparam [SIZE-1:0]	idle = 2'h0,
							calculate = 2'h1,
							finish = 2'h2;
								 
	reg [SIZE-1:0] state_reg, state_next;
	
	reg  rdy_next;
	
	reg  [N-1:0]   a_reg,a_next;
	reg  [2*N-1:0] b_reg,b_next;
	reg  [2*N-1:0] acc_reg, acc_next;
	
	reg  [2*N-1:0] res_next;

	// State register
	always@(posedge clk or posedge rst) begin
		if (rst) begin
			state_reg <= idle;
			rdy		 <= 1'b0;
		end
		else if (ena) begin
			state_reg <= state_next;
			rdy		 <= rdy_next;
		end
	end

	// Registers
	always@(posedge clk or posedge rst) begin
		if (rst) begin
			a_reg 	 <= {(N){1'b0}};
			b_reg 	 <= {(2*N){1'b0}};
			acc_reg  <= {(2*N){1'b0}};
			res		 <= {(2*N){1'b0}};
	
		end
		else if (ena) begin
			a_reg	<= a_next;
			b_reg <= b_next;
			acc_reg <= acc_next;
			res <= res_next;
		end		
	end
	
	// Next state logic
	always@(*) 
		case(state_reg)
			idle 	 : if (start) state_next = calculate;
					   else		  state_next = idle;
			calculate 	 : state_next = finish;
			finish  : if (a_reg == {(N){1'b0}}) 
							state_next = idle;
						else 
							state_next = calculate;
		endcase	

	// Microoperation logic
	always@(*) begin
		a_next   = a_reg;
		b_next   = b_reg;
		acc_next = acc_reg;
		rdy_next = 1'b0;
		res_next = res;
	
		case(state_reg)
			idle			:	if(start == 1'b1) begin
									a_next 	= dataA[N-1:0];
									b_next 	= {{(N){1'b0}}, dataB[N-1:0]};
									res_next = {(N){1'b0}};
									acc_next = {(2*N){1'b0}};
							end
							
			calculate	:	begin
								if(a_reg[0] == 1'b1)
									acc_next = acc_reg + b_reg;
								a_next = a_reg >> 1;
								b_next = b_reg << 1;
							end
							
			finish		:	begin
								if(a_reg == {(2*N){1'b0}}) begin
									res_next = acc_reg;
									rdy_next = 1'b1;
								end
							end
							
			default	: 	;						
		endcase
	end
endmodule

