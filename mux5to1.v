module mux5to1(data000mux5,data010mux5,data101mux5,data001mux5,data110mux5,data011mux5,data100mux5,data111mux5,code5to1,dataSelected5to1);
parameter size = 8;

input [size-1:0] data000mux5,data010mux5,data101mux5,data001mux5,data110mux5,data011mux5,data100mux5,data111mux5;
input [2:0] code5to1;
output [size-1:0] dataSelected5to1;
reg [size-1:0] dataSelected5to1;

always@(*)
begin
	case(code5to1)
	3'b000:dataSelected5to1 = data000mux5;
	3'b001:dataSelected5to1 = data001mux5;
	3'b010:dataSelected5to1 = data010mux5;
	3'b101:dataSelected5to1 = data101mux5;
	3'b110:dataSelected5to1 = data110mux5;
	3'b011:dataSelected5to1 = data011mux5;
	3'b100:dataSelected5to1 = data100mux5;
	3'b111:dataSelected5to1 = data111mux5;
	default: dataSelected5to1 = 8'bx;
	endcase
end

endmodule
