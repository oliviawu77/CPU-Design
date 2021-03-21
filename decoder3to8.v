module decoder3to8(x1d3to8,y1d3to8,z1d3to8,out0d3to8,out1d3to8,out2d3to8,out3d3to8,out4d3to8,out5d3to8,out6d3to8,out7d3to8);

input x1d3to8,y1d3to8,z1d3to8;
output out0d3to8,out1d3to8,out2d3to8,out3d3to8,out4d3to8,out5d3to8,out6d3to8,out7d3to8;

assign out0d3to8 = (~x1d3to8)&(~y1d3to8)&(~z1d3to8); 
assign out1d3to8 = (x1d3to8)&(~y1d3to8)&(~z1d3to8);
assign out2d3to8 = (~x1d3to8)&(y1d3to8)&(~z1d3to8);
assign out3d3to8 = (x1d3to8)&(y1d3to8)&(~z1d3to8);
assign out4d3to8 = (~x1d3to8)&(~y1d3to8)&(z1d3to8);
assign out5d3to8 = (x1d3to8)&(~y1d3to8)&(z1d3to8);
assign out6d3to8 = (~x1d3to8)&(y1d3to8)&(z1d3to8);
assign out7d3to8 = (x1d3to8)&(y1d3to8)&(z1d3to8);

endmodule


