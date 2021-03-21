module ShiftRight(dataShiftRight,dataOutShiftRight);
parameter size = 8, shift1 = 1;
input [size-1:0] dataShiftRight;
output [size-1:0] dataOutShiftRight;

assign dataOutShiftRight = dataShiftRight>>shift1;

endmodule