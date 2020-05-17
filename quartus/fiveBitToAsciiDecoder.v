module fiveBitToAsciiDecoder(
	input [4:0]data,
	input mode,
	output [7:0]char
	);
	
	reg [7:0] next_char;
	
	always@(*)
	begin
		case({mode,data})
			6'b000000 : next_char = 8'b01100001;
			6'b000001 : next_char = 8'b01100010;
			6'b000010 : next_char = 8'b01100011;
			6'b000011 : next_char = 8'b01100100;
			6'b000100 : next_char = 8'b01100101;
			6'b000101 : next_char = 8'b01100110;
			6'b000110 : next_char = 8'b01100111;
			6'b000111 : next_char = 8'b01101000;
			6'b001000 : next_char = 8'b01101001;
			6'b001001 : next_char = 8'b01101010;
			6'b001010 : next_char = 8'b01101011;
			6'b001011 : next_char = 8'b01101100;
			6'b001100 : next_char = 8'b01101101;
			6'b001101 : next_char = 8'b01101110;
			6'b001110 : next_char = 8'b01101111;
			6'b001111 : next_char = 8'b01110000;
			6'b010000 : next_char = 8'b01110001;
			6'b010001 : next_char = 8'b01110010;
			6'b010010 : next_char = 8'b01110011;
			6'b010011 : next_char = 8'b01110100;
			6'b010100 : next_char = 8'b01110101;
			6'b010101 : next_char = 8'b01110110;
			6'b010110 : next_char = 8'b01110111;
			6'b010111 : next_char = 8'b01111000;
			6'b011000 : next_char = 8'b01111001;
			6'b011001 : next_char = 8'b01111010;
			6'b011010 : next_char = 8'b00100000;
			6'b011011 : next_char = 8'b00101100;
			6'b011100 : next_char = 8'b00101110;
			6'b011101 : next_char = 8'b00100001;
			6'b011110 : next_char = 8'b00101101;
			6'b011111 : next_char = 8'b00111111;
			6'b100000 : next_char = 8'b01000001;
			6'b100001 : next_char = 8'b01000010;
			6'b100010 : next_char = 8'b01000011;
			6'b100011 : next_char = 8'b01000100;
			6'b100100 : next_char = 8'b01000101;
			6'b100101 : next_char = 8'b01000110;
			6'b100110 : next_char = 8'b01000111;
			6'b100111 : next_char = 8'b01001000;
			6'b101000 : next_char = 8'b01001001;
			6'b101001 : next_char = 8'b01001010;
			6'b101010 : next_char = 8'b01001011;
			6'b101011 : next_char = 8'b01001100;
			6'b101100 : next_char = 8'b01001101;
			6'b101101 : next_char = 8'b01001110;
			6'b101110 : next_char = 8'b01001111;
			6'b101111 : next_char = 8'b01010000;
			6'b110000 : next_char = 8'b01010001;
			6'b110001 : next_char = 8'b01010010;
			6'b110010 : next_char = 8'b01010011;
			6'b110011 : next_char = 8'b01010100;
			6'b110100 : next_char = 8'b01010101;
			6'b110101 : next_char = 8'b01010110;
			6'b110110 : next_char = 8'b01010111;
			6'b110111 : next_char = 8'b01011000;
			6'b111000 : next_char = 8'b01011001;
			6'b111001 : next_char = 8'b01011010;
			6'b111010 : next_char = 8'b00100000;
			6'b111011 : next_char = 8'b00101100;
			6'b111100 : next_char = 8'b00101110;
			6'b111101 : next_char = 8'b00100001;
			6'b111110 : next_char = 8'b00101101;
			6'b111111 : next_char = 8'b00111111;
			default : next_char = 8'b00000000;
		endcase
	end
	assign char = next_char;
endmodule