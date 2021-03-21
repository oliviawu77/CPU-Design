module shift(DataBShiftIn,codeShiftt,shiftOut);

parameter size = 8, A = 1;

input [size-1:0] DataBShiftIn;
input [1:0] codeShiftt;

wire [size-1:0] dataDirect,dataRight,dataLeft;

output [size-1:0] shiftOut;
reg [size-1:0] shiftOut;


always@(*)
begin
	case(codeShiftt)
		2'b00: //DirectOut
		begin
			shiftOut = dataDirect;
		end
		2'b01: //RIGHT
		begin
			shiftOut = dataRight;
		end
		2'b10: //LEFT
		begin
			shiftOut = dataLeft;
		end
		default:
			shiftOut = 8'bx;
	endcase
end

ShiftRight right(
	.dataShiftRight (DataBShiftIn),
	.dataOutShiftRight (dataRight)
	);
ShiftLeft left(
	.dataShiftLeft (DataBShiftIn),
	.dataOutShiftLeft (dataLeft)
	);
ShiftDirect direct(
	.dataShiftDirect (DataBShiftIn),
	.dataOutShiftDirect (dataDirect)
	);


endmodule
