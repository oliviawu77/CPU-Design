module DataPathWithMemory(clk,constant,MB,RW,DA,AA,BA,V,C,N,Z,FS,MD,MW,jumpAddressOutp,datadpOutp);
parameter size = 8;

input clk,MB,RW,MD,MW;
output V,C,N,Z;
input [1:0] AA,BA,DA;
output [size-1:0] jumpAddressOutp,datadpOutp;
input [3:0] FS;
input [size-1:0] constant;

wire [size-1:0] dataFromMemoryToDatapath,rAtoMemoryAddress,rBtoMemoryData;

datapath DataPaTH(
	.clk (clk),
	.constantIn (constant),
	.MB (MB),
	.RW (RW),
	.DA (DA),
	.AA (AA),
	.BA (BA),
	.V (V),
	.C (C),
	.N (N),
	.Z (Z),
	.FS (FS),
	.MD (MD),
	.addressOut (rAtoMemoryAddress),
	.DataInFromMemory (dataFromMemoryToDatapath),
	.DataOut (rBtoMemoryData),
	.jumpAddress (jumpAddressOutp),
	.datadpOut (datadpOutp)
	);

dataMemory Memory(
	.MW (MW),
	.clk (clk),
	.dataInMemory (rBtoMemoryData),
	.AddressOfMemory (rAtoMemoryAddress),
	.dataOutFromMemory (dataFromMemoryToDatapath)
);

endmodule
