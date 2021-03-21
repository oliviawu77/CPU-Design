module Reg(clk,enReg,dataInreg,Rout);
parameter size = 8;

input clk;
input  enReg;
reg [size-1:0] Rin;
input [size-1:0] dataInreg;

output [size-1:0] Rout;
reg [size-1:0] Rout;

wire [size-1:0] RoutBack;
wire [size-1:0] dataSel;
always@(posedge clk)
begin
		/*Rout[7] <= Rin[7];
		Rout[6] <= Rin[6];
		Rout[5] <= Rin[5];
		Rout[4] <= Rin[4];
		Rout[3] <= Rin[3];
		Rout[2] <= Rin[2];
		Rout[1] <= Rin[1];
		Rout[0] <= Rin[0];
		*/
	Rout <= dataSel;
end
mux2to1 muxInRegg(
	.data0mux2 (RoutBack),
	.data1mux2 (dataInreg),
	.selectmux2 (enReg),
	.dataSelectedmux2 (dataSel)
	);
assign RoutBack = Rout;
/*assign Rin[7] = (en&data[7]) | (~en&Rout[7]);
assign Rin[6] = (en&data[6]) | (~en&Rout[6]);
assign Rin[5] = (en&data[5]) | (~en&Rout[5]);
assign Rin[4] = (en&data[4]) | (~en&Rout[4]);
assign Rin[3] = (en&data[3]) | (~en&Rout[3]);
assign Rin[2] = (en&data[2]) | (~en&Rout[2]);
assign Rin[1] = (en&data[1]) | (~en&Rout[1]);
assign Rin[0] = (en&data[0]) | (~en&Rout[0]);
*/
endmodule 