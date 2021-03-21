module datapath(clk,constantIn,MB,RW,DA,AA,BA,V,C,N,Z,FS,MD,DataInFromMemory,addressOut,DataOut,jumpAddress,datadpOut);
parameter size = 8;

input clk;
input RW;
input [1:0] DA,AA,BA;
input [size-1:0] constantIn;
input [size-1:0] DataInFromMemory;

input MB,MD;
input [3:0] FS;

output V,C,N,Z;
output [size-1:0] jumpAddress,addressOut,DataOut,datadpOut;

wire [size-1:0] dataInReg,DataBFromReg,DataAFromReg,DataBSelected,DataOutFun;

RegFile regF(
	.DataInRegg (dataInReg),
	.Write (RW),
	.DAddress (DA),
	.AAddress (AA),
	.BAddress (BA),
	.dataA (DataAFromReg),
	.dataB (DataBFromReg),
	.clk (clk)
	);

funtionUnit FU(
	.FunSel (FS),
	.dataA (DataAFromReg),
	.dataB (DataBSelected),
	.V (V),
	.C (C),
	.N (N),
	.Z (Z),
	.FuntionOut (DataOutFun)
	);

mux2to1 selB(
	.data0mux2 (DataBFromReg),
	.data1mux2 (constantIn),
	.selectmux2 (MB),
	.dataSelectedmux2 (DataBSelected)
	);

mux2to1 selF(
	.data0mux2 (DataOutFun),
	.data1mux2 (DataInFromMemory),
	.selectmux2 (MD),
	.dataSelectedmux2 (dataInReg)
	);

assign jumpAddress = DataAFromReg;
assign addressOut = DataAFromReg;
assign DataOut = DataBSelected;
assign datadpOut = dataInReg;
endmodule
