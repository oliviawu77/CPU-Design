module mux4to1(data0mux4to1,data1mux4to1,data2mux4to1,data3mux4to1,selectmux4to1,dataSelectedmux4to1);
parameter size = 8;

input [size-1:0] data0mux4to1,data1mux4to1,data2mux4to1,data3mux4to1;
input [1:0] selectmux4to1;

output [size-1:0] dataSelectedmux4to1;
reg [size-1:0] dataSelectedmux4to1;

always@(*)
begin
	case(selectmux4to1)
	2'b00:dataSelectedmux4to1 = data0mux4to1;
	2'b01:dataSelectedmux4to1 = data1mux4to1;
	2'b10:dataSelectedmux4to1 = data2mux4to1;
	2'b11:dataSelectedmux4to1 = data3mux4to1;
	endcase
end
endmodule
