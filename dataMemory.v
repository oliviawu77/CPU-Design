module dataMemory(MW,clk,dataInMemory,AddressOfMemory,dataOutFromMemory);

parameter size = 8;
input MW,clk;
input [size-1:0] dataInMemory;
input [2:0] AddressOfMemory;
wire [size-1:0] dataSelectedInMemory;

output [size-1:0] dataOutFromMemory;

wire MdecOut0,MdecOut1,MdecOut2,MdecOut3,MdecOut4,MdecOut5,MdecOut6,MdecOut7;
wire Mload0,Mload1,Mload2,Mload3,Mload4,Mload5,Mload6,Mload7;
wire [size-1:0] dataInMemoryOut0,dataInMemoryOut1,dataInMemoryOut2,dataInMemoryOut3,dataInMemoryOut4,dataInMemoryOut5,dataInMemoryOut6,dataInMemoryOut7;

decoder3to8 decoInMemory(
	.x1d3to8 (AddressOfMemory[0]),
	.y1d3to8 (AddressOfMemory[1]),
	.z1d3to8 (AddressOfMemory[2]),
	.out0d3to8 (MdecOut0),
	.out1d3to8 (MdecOut1),
	.out2d3to8 (MdecOut2),
	.out3d3to8 (MdecOut3),
	.out4d3to8 (MdecOut4),
	.out5d3to8 (MdecOut5),
	.out6d3to8 (MdecOut6),
	.out7d3to8 (MdecOut7)
	);
mux5to1 muxInMemory( //it's 8to1
	.data000mux5 (dataInMemoryOut0),
	.data001mux5 (dataInMemoryOut1),
	.data010mux5 (dataInMemoryOut2),
	.data011mux5 (dataInMemoryOut3),
	.data100mux5 (dataInMemoryOut4),
	.data101mux5 (dataInMemoryOut5),
	.data110mux5 (dataInMemoryOut6),
	.data111mux5 (dataInMemoryOut7),
	.codemux5 (AddressOfMemory),
	.dataSelectedmux5 (dataSelectedInMemory)
	);
	
Reg m0(
	.clk (clk),
	.enReg (Mload0),
	.dataInreg (dataInMemory),
	.Rout (dataInMemoryOut0)
);
Reg m1(
	.clk (clk),
	.enReg (Mload1),
	.data (dataInMemory),
	.Rout (dataInMemoryOut1)
);
Reg m2(
	.clk (clk),
	.enReg (Mload2),
	.data (dataInMemory),
	.Rout (dataInMemoryOut2)
);
Reg m3(
	.clk (clk),
	.enReg (Mload3),
	.data (dataInMemory),
	.Rout (dataInMemoryOut3)
);
Reg m4(
	.clk (clk),
	.enReg (Mload4),
	.data (dataInMemory),
	.Rout (dataInMemoryOut4)
);
Reg m5(
	.clk (clk),
	.enReg (Mload5),
	.data (dataInMemory),
	.Rout (dataInMemoryOut5)
);
Reg m6(
	.clk (clk),
	.enReg (Mload6),
	.data (dataInMemory),
	.Rout (dataInMemoryOut6)
);
Reg m7(
	.clk (clk),
	.enReg (Mload7),
	.data (dataInMemory),
	.Rout (dataInMemoryOut7)
);
assign dataOutFromMemory = dataSelectedInMemory;
assign Mload0 =  MW & MdecOut0;
assign Mload1 =  MW & MdecOut1;
assign Mload2 =  MW & MdecOut2;
assign Mload3 =  MW & MdecOut3;
assign Mload4 =  MW & MdecOut4;
assign Mload5 =  MW & MdecOut5;
assign Mload6 =  MW & MdecOut6;
assign Mload7 =  MW & MdecOut7;
endmodule


