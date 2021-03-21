//and or xor not
module logicBasic(xlogicBasic,ylogicBasic,outlogicBasic,codelogicBasic);
parameter size = 8;
input [size-1:0] xlogicBasic,ylogicBasic;
input [1:0] codelogicBasic;

output [size-1:0] outlogicBasic;
reg [size-1:0] outlogicBasic;
always@(*)
begin
	case(codelogicBasic)
		2'b00: outlogicBasic = xlogicBasic & ylogicBasic;
		2'b01: outlogicBasic = xlogicBasic | ylogicBasic;
		2'b10: outlogicBasic = xlogicBasic ^ ylogicBasic;
		2'b11: outlogicBasic = ~xlogicBasic;
	endcase
end

endmodule
