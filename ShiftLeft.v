module ShiftLeft(dataShiftLeft,dataOutShiftLeft);
parameter size = 8, shift1 = 1;
input [size-1:0] dataShiftLeft;
output [size-1:0] dataOutShiftLeft;

assign dataOutShiftLeft = dataShiftLeft<<shift1;

endmodule