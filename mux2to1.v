module mux2to1(data0mux2,data1mux2,selectmux2,dataSelectedmux2);
	parameter size = 8;
	input [size-1:0] data0mux2,data1mux2;
	input selectmux2;
	output [size-1:0] dataSelectedmux2;
	
	reg [size-1:0] dataSelectedmux2;
always@(*)
begin
	case(selectmux2)
	1'b0:dataSelectedmux2 = data0mux2;
	1'b1:dataSelectedmux2 = data1mux2;
	endcase
end

endmodule
