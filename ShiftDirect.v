module ShiftDirect(dataShiftDirect,dataOutShiftDirect);
parameter size = 8;
input [size-1:0] dataShiftDirect;
output [size-1:0] dataOutShiftDirect;

assign dataOutShiftDirect = dataShiftDirect;

endmodule
