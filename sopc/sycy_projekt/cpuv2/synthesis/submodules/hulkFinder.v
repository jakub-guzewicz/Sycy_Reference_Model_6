module hulkFinder(
	input clk,
	input ena,
	input rst,
	input start,
	//input mode,
	//input [63:0] cipher,
	input [31:0] dataA, dataB,
	//output [31:0] resultA, resultB, resultC, resultD,
	//output [127:0] cipherKey,
	output [31:0] result,
	output rdy
	);
	
	//REG/WIRE
	wire	[29:0] lfsr;
	wire	[7:0] char0;
	wire	[7:0] char1;
	wire	[7:0] char2;
	wire	[7:0] char3;
	wire	[7:0] char4;
	wire	[7:0] char5;
	wire	[127:0] key;
	wire	[63:0] decrypted;
	reg	[79:0] firstKeyPart;
	
	wire [63:0] teaWire01;
	wire [63:0] teaWire12;
	wire [63:0] teaWire23;
	wire [63:0] teaWire34;
	wire [63:0] teaWire45;
	wire [63:0] teaWire56;
	wire [63:0] teaWire67;
	wire [63:0] teaWire78;
	wire [63:0] teaWire89;
	wire [63:0] teaWire910;
	wire [63:0] teaWire1011;
	wire [63:0] teaWire1112;
	wire [63:0] teaWire1213;
	wire [63:0] teaWire1314;
	wire [63:0] teaWire1415;
	wire [63:0] teaWire1516;
	wire [63:0] teaWire1617;
	wire [63:0] teaWire1718;
	wire [63:0] teaWire1819;
	wire [63:0] teaWire1920;
	wire [63:0] teaWire2021;
	wire [63:0] teaWire2122;
	wire [63:0] teaWire2223;
	wire [63:0] teaWire2324;
	wire [63:0] teaWire2425;
	wire [63:0] teaWire2526;
	wire [63:0] teaWire2627;
	wire [63:0] teaWire2728;
	wire [63:0] teaWire2829;
	wire [63:0] teaWire2930;
	wire [63:0] teaWire3031;
	wire [63:0] teaWire3132;
	
	wire [30:0] LfsrStateWire0;
	wire [30:0] LfsrStateWire1;
	wire [30:0] LfsrStateWire2;
	wire [30:0] LfsrStateWire3;
	wire [30:0] LfsrStateWire4;
	wire [30:0] LfsrStateWire5;
	wire [30:0] LfsrStateWire6;
	wire [30:0] LfsrStateWire7;
	wire [30:0] LfsrStateWire8;
	wire [30:0] LfsrStateWire9;
	wire [30:0] LfsrStateWire10;
	wire [30:0] LfsrStateWire11;
	wire [30:0] LfsrStateWire12;
	wire [30:0] LfsrStateWire13;
	wire [30:0] LfsrStateWire14;
	wire [30:0] LfsrStateWire15;
	wire [30:0] LfsrStateWire16;
	wire [30:0] LfsrStateWire17;
	wire [30:0] LfsrStateWire18;
	wire [30:0] LfsrStateWire19;
	wire [30:0] LfsrStateWire20;
	wire [30:0] LfsrStateWire21;
	wire [30:0] LfsrStateWire22;
	wire [30:0] LfsrStateWire23;
	wire [30:0] LfsrStateWire24;
	wire [30:0] LfsrStateWire25;
	wire [30:0] LfsrStateWire26;
	wire [30:0] LfsrStateWire27;
	wire [30:0] LfsrStateWire28;
	wire [30:0] LfsrStateWire29;
	wire [30:0] LfsrStateWire30;
	wire [30:0] LfsrStateWire31;
	
	wire [127:0] keyWire0;
	wire [127:0] keyWire1;
	wire [127:0] keyWire2;
	wire [127:0] keyWire3;
	wire [127:0] keyWire4;
	wire [127:0] keyWire5;
	wire [127:0] keyWire6;
	wire [127:0] keyWire7;
	wire [127:0] keyWire8;
	wire [127:0] keyWire9;
	wire [127:0] keyWire10;
	wire [127:0] keyWire11;
	wire [127:0] keyWire12;
	wire [127:0] keyWire13;
	wire [127:0] keyWire14;
	wire [127:0] keyWire15;
	wire [127:0] keyWire16;
	wire [127:0] keyWire17;
	wire [127:0] keyWire18;
	wire [127:0] keyWire19;
	wire [127:0] keyWire20;
	wire [127:0] keyWire21;
	wire [127:0] keyWire22;
	wire [127:0] keyWire23;
	wire [127:0] keyWire24;
	wire [127:0] keyWire25;
	wire [127:0] keyWire26;
	wire [127:0] keyWire27;
	wire [127:0] keyWire28;
	wire [127:0] keyWire29;
	wire [127:0] keyWire30;
	wire [127:0] keyWire31;
	
	wire periodFinished;
	wire mode;
	reg [1:0] mode_reg = 1'b0;
	
	//Zmiana
	
	assign mode = mode_reg;
	assign result = {1'b0,LfsrStateWire31};

	
	always@(*) begin
		if(periodFinished)
			mode_reg = ~mode_reg;
	end
	
	
	always@(mode)
	begin
		if(mode==1'b0)
			firstKeyPart = 80'h48756c6b206973207468;
		else
			firstKeyPart = 80'h48554c4b204953205448;
	end
	
	
	assign key = {firstKeyPart,char5,char4,char3,char2,char1,char0};
	
	random_generator gen0(
		.rst	(rst),
		.clk	(clk),
		.ena	(ena),
		.lfsr_next(lfsr),
		.period_end(periodFinished)
		
	);
	
	pdfCheckerFsm fsm0(
		.rst(rst),
		.clk(clk),
		.ena(ena),
		.givenKey(keyWire31),
		.data(decrypted),
		.foundKey({resultA,resultB,resultC,resultD}),	
		.rdy(rdy)
	);
	
	fiveBitToAsciiDecoder dec0(
		.data(lfsr[4:0]),
		.mode(mode),
		.char(char0)
	);
	
	fiveBitToAsciiDecoder dec1(
		.data(lfsr[9:5]),
		.mode(mode),
		.char(char1)
	);
	
	fiveBitToAsciiDecoder dec2(
		.data(lfsr[14:10]),
		.mode(mode),
		.char(char2)
	);
	
	fiveBitToAsciiDecoder dec3(
		.data(lfsr[19:15]),
		.mode(mode),
		.char(char3)
	);
	
	fiveBitToAsciiDecoder dec4(
		.data(lfsr[24:20]),
		.mode(mode),
		.char(char4)
	);
	
	fiveBitToAsciiDecoder dec5(
		.data(lfsr[29:25]),
		.mode(mode),
		.char(char5)
	);
	
// First version
/*	teaDecryptor tea0(
		.cipher(cipher),
		.key(key),
		.data(decrypted)
	);
*/
	
//Second version D:
//	with wires

	

	
	singleTeaBlock tea0(
		.key(key),
		.clk(clk),
		.inData({dataA,dataB}),
		.sum(32'hc6ef3720),
		.outData(teaWire01),
		.inLfsrState({mode, lfsr[29:0]}),
		.outLfsrState(LfsrStateWire0),
		.keyOutput(keyWire0)
	);

	singleTeaBlock tea1(
		.key(keyWire0),
		.clk(clk),
		.inData(teaWire01),
		.sum(32'h28b7bd67),
		.outData(teaWire12),
		.inLfsrState(LfsrStateWire0),
		.outLfsrState(LfsrStateWire1),
		.keyOutput(keyWire1)
	);

	singleTeaBlock tea2(
		.key(keyWire1),
		.clk(clk),
		.inData(teaWire12),
		.sum(32'h8a8043ae),
		.outData(teaWire23),
		.inLfsrState(LfsrStateWire1),
		.outLfsrState(LfsrStateWire2),
		.keyOutput(keyWire2)
	);

	singleTeaBlock tea3(
		.key(keyWire2),
		.clk(clk),
		.inData(teaWire23),
		.sum(32'hec48c9f5),
		.outData(teaWire34),
		.inLfsrState(LfsrStateWire2),
		.outLfsrState(LfsrStateWire3),
		.keyOutput(keyWire3)
	);

	singleTeaBlock tea4(
		.key(keyWire3),
		.clk(clk),
		.inData(teaWire34),
		.sum(32'h4e11503c),
		.outData(teaWire45),
		.inLfsrState(LfsrStateWire3),
		.outLfsrState(LfsrStateWire4),
		.keyOutput(keyWire4)
	);

	singleTeaBlock tea5(
		.key(keyWire4),
		.clk(clk),
		.inData(teaWire45),
		.sum(32'hafd9d683),
		.outData(teaWire56),
		.inLfsrState(LfsrStateWire4),
		.outLfsrState(LfsrStateWire5),
		.keyOutput(keyWire5)
	);

	singleTeaBlock tea6(
		.key(keyWire5),
		.clk(clk),
		.inData(teaWire56),
		.sum(32'h11a25cca),
		.outData(teaWire67),
		.inLfsrState(LfsrStateWire5),
		.outLfsrState(LfsrStateWire6),
		.keyOutput(keyWire6)
	);

	singleTeaBlock tea7(
		.key(keyWire6),
		.clk(clk),
		.inData(teaWire67),
		.sum(32'h736ae311),
		.outData(teaWire78),
		.inLfsrState(LfsrStateWire6),
		.outLfsrState(LfsrStateWire7),
		.keyOutput(keyWire7)
	);

	singleTeaBlock tea8(
		.key(keyWire7),
		.clk(clk),
		.inData(teaWire78),
		.sum(32'hd5336958),
		.outData(teaWire89),
		.inLfsrState(LfsrStateWire7),
		.outLfsrState(LfsrStateWire8),
		.keyOutput(keyWire8)
	);

	singleTeaBlock tea9(
		.key(keyWire8),
		.clk(clk),
		.inData(teaWire89),
		.sum(32'h36fbef9f),
		.outData(teaWire910),
		.inLfsrState(LfsrStateWire8),
		.outLfsrState(LfsrStateWire9),
		.keyOutput(keyWire9)
	);

	singleTeaBlock tea10(
		.key(keyWire9),
		.clk(clk),
		.inData(teaWire910),
		.sum(32'h98c475e6),
		.outData(teaWire1011),
		.inLfsrState(LfsrStateWire9),
		.outLfsrState(LfsrStateWire10),
		.keyOutput(keyWire10)
	);

	singleTeaBlock tea11(
		.key(keyWire10),
		.clk(clk),
		.inData(teaWire1011),
		.sum(32'hfa8cfc2d),
		.outData(teaWire1112),
		.inLfsrState(LfsrStateWire10),
		.outLfsrState(LfsrStateWire11),
		.keyOutput(keyWire11)
	);

	singleTeaBlock tea12(
		.key(keyWire11),
		.clk(clk),
		.inData(teaWire1112),
		.sum(32'h5c558274),
		.outData(teaWire1213),
		.inLfsrState(LfsrStateWire11),
		.outLfsrState(LfsrStateWire12),
		.keyOutput(keyWire12)
	);

	singleTeaBlock tea13(
		.key(keyWire12),
		.clk(clk),
		.inData(teaWire1213),
		.sum(32'hbe1e08bb),
		.outData(teaWire1314),
		.inLfsrState(LfsrStateWire12),
		.outLfsrState(LfsrStateWire13),
		.keyOutput(keyWire13)
	);

	singleTeaBlock tea14(
		.key(keyWire13),
		.clk(clk),
		.inData(teaWire1314),
		.sum(32'h1fe68f02),
		.outData(teaWire1415),
		.inLfsrState(LfsrStateWire13),
		.outLfsrState(LfsrStateWire14),
		.keyOutput(keyWire14)
	);

	singleTeaBlock tea15(
		.key(keyWire14),
		.clk(clk),
		.inData(teaWire1415),
		.sum(32'h81af1549),
		.outData(teaWire1516),
		.inLfsrState(LfsrStateWire14),
		.outLfsrState(LfsrStateWire15),
		.keyOutput(keyWire15)
	);

	singleTeaBlock tea16(
		.key(keyWire15),
		.clk(clk),
		.inData(teaWire1516),
		.sum(32'he3779b90),
		.outData(teaWire1617),
		.inLfsrState(LfsrStateWire15),
		.outLfsrState(LfsrStateWire16),
		.keyOutput(keyWire16)
	);

	singleTeaBlock tea17(
		.key(keyWire16),
		.clk(clk),
		.inData(teaWire1617),
		.sum(32'h454021d7),
		.outData(teaWire1718),
		.inLfsrState(LfsrStateWire16),
		.outLfsrState(LfsrStateWire17),
		.keyOutput(keyWire17)
	);

	singleTeaBlock tea18(
		.key(keyWire17),
		.clk(clk),
		.inData(teaWire1718),
		.sum(32'ha708a81e),
		.outData(teaWire1819),
		.inLfsrState(LfsrStateWire17),
		.outLfsrState(LfsrStateWire18),
		.keyOutput(keyWire18)
	);

	singleTeaBlock tea19(
		.key(keyWire18),
		.clk(clk),
		.inData(teaWire1819),
		.sum(32'h8d12e65),
		.outData(teaWire1920),
		.inLfsrState(LfsrStateWire18),
		.outLfsrState(LfsrStateWire19),
		.keyOutput(keyWire19)
	);

	singleTeaBlock tea20(
		.key(keyWire19),
		.clk(clk),
		.inData(teaWire1920),
		.sum(32'h6a99b4ac),
		.outData(teaWire2021),
		.inLfsrState(LfsrStateWire19),
		.outLfsrState(LfsrStateWire20),
		.keyOutput(keyWire20)
	);

	singleTeaBlock tea21(
		.key(keyWire20),
		.clk(clk),
		.inData(teaWire2021),
		.sum(32'hcc623af3),
		.outData(teaWire2122),
		.inLfsrState(LfsrStateWire20),
		.outLfsrState(LfsrStateWire21),
		.keyOutput(keyWire21)
	);

	singleTeaBlock tea22(
		.key(keyWire21),
		.clk(clk),
		.inData(teaWire2122),
		.sum(32'h2e2ac13a),
		.outData(teaWire2223),
		.inLfsrState(LfsrStateWire21),
		.outLfsrState(LfsrStateWire22),
		.keyOutput(keyWire22)
	);

	singleTeaBlock tea23(
		.key(keyWire22),
		.clk(clk),
		.inData(teaWire2223),
		.sum(32'h8ff34781),
		.outData(teaWire2324),
		.inLfsrState(LfsrStateWire22),
		.outLfsrState(LfsrStateWire23),
		.keyOutput(keyWire23)
	);

	singleTeaBlock tea24(
		.key(keyWire23),
		.clk(clk),
		.inData(teaWire2324),
		.sum(32'hf1bbcdc8),
		.outData(teaWire2425),
		.inLfsrState(LfsrStateWire23),
		.outLfsrState(LfsrStateWire24),
		.keyOutput(keyWire24)
	);

	singleTeaBlock tea25(
		.key(keyWire24),
		.clk(clk),
		.inData(teaWire2425),
		.sum(32'h5384540f),
		.outData(teaWire2526),
		.inLfsrState(LfsrStateWire24),
		.outLfsrState(LfsrStateWire25),
		.keyOutput(keyWire25)
	);

	singleTeaBlock tea26(
		.key(keyWire25),
		.clk(clk),
		.inData(teaWire2526),
		.sum(32'hb54cda56),
		.outData(teaWire2627),
		.inLfsrState(LfsrStateWire25),
		.outLfsrState(LfsrStateWire26),
		.keyOutput(keyWire26)
	);

	singleTeaBlock tea27(
		.key(keyWire26),
		.clk(clk),
		.inData(teaWire2627),
		.sum(32'h1715609d),
		.outData(teaWire2728),
		.inLfsrState(LfsrStateWire26),
		.outLfsrState(LfsrStateWire27),
		.keyOutput(keyWire27)
	);

	singleTeaBlock tea28(
		.key(keyWire27),
		.clk(clk),
		.inData(teaWire2728),
		.sum(32'h78dde6e4),
		.outData(teaWire2829),
		.inLfsrState(LfsrStateWire27),
		.outLfsrState(LfsrStateWire28),
		.keyOutput(keyWire28)
	);

	singleTeaBlock tea29(
		.clk(clk),
		.key(keyWire28),
		.inData(teaWire2829),
		.sum(32'hdaa66d2b),
		.outData(teaWire2930),
		.inLfsrState(LfsrStateWire28),
		.outLfsrState(LfsrStateWire29),
		.keyOutput(keyWire29)
	);

	singleTeaBlock tea30(
		.clk(clk),
		.key(keyWire29),
		.inData(teaWire2930),
		.sum(32'h3c6ef372),
		.outData(teaWire3031),
		.inLfsrState(LfsrStateWire29),
		.outLfsrState(LfsrStateWire30),
		.keyOutput(keyWire30)
	);

	singleTeaBlock tea31(
		.clk(clk),
		.key(keyWire30),
		.inData(teaWire3031),
		.sum(32'h9e3779b9),
		.outData(decrypted),
		.inLfsrState(LfsrStateWire30),
		.outLfsrState(LfsrStateWire31),
		.keyOutput(keyWire31)
	);


		

	
endmodule