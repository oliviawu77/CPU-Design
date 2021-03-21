module decoder2to4(xd2to4,yd2to4,out0d2to4,out1d2to4,out2d2to4,out3d2to4);

input xd2to4, yd2to4;
output out0d2to4,out1d2to4,out2d2to4,out3d2to4;

assign out0d2to4 = ~xd2to4 & ~yd2to4;
assign out1d2to4 = xd2to4 & ~yd2to4;
assign out2d2to4 = ~xd2to4 & yd2to4;
assign out3d2to4 = xd2to4 & yd2to4;

endmodule