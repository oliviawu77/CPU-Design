module RegFile(clk,DataInRegg,Write,DAddress,AAddress,BAddress,dataA,dataB,Rout0,Rout1,Rout2,Rout3);

parameter size = 8;

input clk;
input [size-1:0] DataInRegg;
input Write;
input [1:0] DAddress,AAddress,BAddress;

output [size-1:0] dataA, dataB;

wire load0,load1,load2,load3;
wire decoderOut0,decoderOut1,decoderOut2,decoderOut3;
wire [size-1:0] Rout0,Rout1,Rout2,Rout3;
wire [size-1:0] dataASelOut,dataBSelOut;

output [size-1:0] Rout0,Rout1,Rout2,Rout3;

Reg R0(
	.clk (clk),
	.enReg (load0),
	.dataInreg (DataInRegg),
	.Rout (Rout0)
);
Reg R1(
	.clk (clk),
	.enReg (load1),
	.dataInreg (DataInRegg),
	.Rout (Rout1)
);
Reg R2(
	.clk (clk),
	.enReg (load2),
	.dataInreg (DataInRegg),
	.Rout (Rout2)
);
Reg R3(
	.clk (clk),
	.enReg (load3),
	.dataInreg (DataInRegg),
	.Rout (Rout3)
);

decoder2to4 dec(
	.xd2to4 (DAddress[0]),
	.yd2to4 (DAddress[1]),
	.out0d2to4 (decoderOut0),
	.out1d2to4 (decoderOut1),
	.out2d2to4 (decoderOut2),
	.out3d2to4 (decoderOut3)
);


mux4to1 muxA(
	.data0mux4to1 (Rout0),
	.data1mux4to1 (Rout1),
	.data2mux4to1 (Rout2),
	.data3mux4to1 (Rout3),
	.selectmux4to1 (AAddress),
	.dataSelectedmux4to1 (dataASelOut)
);

mux4to1 muxB(
	.data0mux4to1 (Rout0),
	.data1mux4to1 (Rout1),
	.data2mux4to1 (Rout2),
	.data3mux4to1 (Rout3),
	.selectmux4to1 (BAddress),
	.dataSelectedmux4to1 (dataBSelOut)
);

assign load0 = Write & decoderOut0;
assign load1 = Write & decoderOut1;
assign load2 = Write & decoderOut2;
assign load3 = Write & decoderOut3;
assign dataA = dataASelOut;
assign dataB = dataBSelOut;

endmodule
