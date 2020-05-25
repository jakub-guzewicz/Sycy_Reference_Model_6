module singleTeaBlock(
	input	clk,
	input [127:0] key,
	input [63:0]inData,
	input [31:0]sum,
	output [63:0]outData
);
	reg [31:0] block1;
	reg [31:0] block2;
	
	always@(posedge clk)
	begin
		block2 = inData[31:0];
		block1 = inData[63:32];
		
		//block2 = block2 - (({block1[27:0],4'b0000}+key[63:32]) ^ (block1 + sum) ^ ({5'b00000,block1[31:5]}+key[31:0]));
		//block1 = block1 - (({block2[27:0],4'b0000}+key[127:96]) ^ (block2 + sum) ^ ({5'b00000,block2[31:5]}+key[95:64]));
		block2 = block2 - (((block1 << 4)+key[63:32]) ^ (block1 + sum) ^ ((block1 >> 5)+key[31:0]));
		block1 = block1 - (((block2 << 4)+key[127:96]) ^ (block2 + sum) ^ ((block2 >> 5)+key[95:64]));
	end
	assign outData = {block1,block2};
endmodule