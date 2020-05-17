module teaDecryptor(
	input [127:0]key,
	input [63:0]cipher,
	output [63:0]data
	);
	
	reg [31:0] block1;
	reg [31:0] block2;
	reg [5:0]n;
	integer delta=32'h9e3779b9;
	reg [31:0]sum;
	
	always@(*)
	begin
		block2 = cipher[31:0];
		block1 = cipher[63:32];
		n = 6'b000000;
		sum = 32'hc6ef3720;
		
		
		for (n=0; n[5]==1'b0; n=n+6'b000001)
			begin
				block2 = block2 - (({block1[27:0],4'b0000}+key[63:32]) ^ (block1 + sum) ^ ({5'b00000,block1[31:5]}+key[31:0]));
				block1 = block1 - (({block2[27:0],4'b0000}+key[127:96]) ^ (block2 + sum) ^ ({5'b00000,block2[31:5]}+key[95:64]));
				sum = sum - delta;
			end
		
	end
	assign data = {block1,block2};
	
endmodule