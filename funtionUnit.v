module funtionUnit(FunSel,dataA,dataB,V,C,N,Z,FuntionOut);
parameter size = 8;

input [3:0] FunSel; 
input [size-1:0] dataA, dataB;

wire [size-1:0] dataOoutAu, dataOutLogic, dataOutShift;

output V,C,N,Z;
output [size-1:0] FuntionOut;
reg [size-1:0] FuntionOut;

always@(*)
begin
	case(FunSel[3:2])
		2'b00:FuntionOut = dataOoutAu;
		2'b01:FuntionOut = dataOoutAu;
		2'b10:FuntionOut = dataOutLogic;
		2'b11:FuntionOut = dataOutShift;
		default:FuntionOut = 8'bx;
		
	endcase
end

aluBasic AU(
	.AaluBasic (dataA),
	.BaluBasic (dataB),
	.OaluBasic (dataOoutAu),
	.CodealuBasic (FunSel[2:0]),
	.v (V),
	.c (C),
	.n (N),
	.z (Z)
	);
	
logicBasic LU(
	.xlogicBasic (dataA),
	.ylogicBasic (dataB),
	.outlogicBasic (dataOutLogic),
	.codelogicBasic (FunSel[1:0])
	);
	
shift SU(
	.DataBShiftIn (dataB),
	.codeShiftt (FunSel[1:0]),
	.shiftOut (dataOutShift)
	);

endmodule
