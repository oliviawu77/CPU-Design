module aluBasic(AaluBasic,BaluBasic,OaluBasic,CodealuBasic,carryInaluBasic,v,c,n,z);

parameter size = 8;

input [size-1:0] AaluBasic,BaluBasic;
input [2:0] CodealuBasic;
input carryInaluBasic;

wire [size-1:0] addB;

wire [size-1:0] addOut;
output [size-1:0] OaluBasic;
wire carryOut1,carryOut2;

output v,c,n,z;


adder add(
	//.carry_in (carryIn),
	.a (AaluBasic),
	.b (addB),
	.sum (addOut),
	.carry_out1 (carryOut1),
	.carry_out2 (carryOut2)
	);
	
mux5to1 muxB(
	.data000mux5 (8'b00000000),
	.data001mux5 (8'b00000001),
	.data010mux5 (BaluBasic),
	.data101mux5 (~BaluBasic+1),
	.data110mux5 (~(8'b00000001)+1),
	.data011mux5 (BaluBasic+1),
	.data100mux5 (~BaluBasic),
	.data111mux5 (8'b00000000),
	.code5to1 (CodealuBasic),
	.dataSelected5to1 (addB)
	);
	
assign v = carryOut1 ^ carryOut2;
assign c = carryOut1;
assign n = addOut[7];
assign z = !(addOut[7]|addOut[6]|addOut[5]|addOut[4]|addOut[3]|addOut[2]|addOut[1]|addOut[0]);
assign OaluBasic = addOut;

endmodule
