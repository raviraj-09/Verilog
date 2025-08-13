// Multiplexer 8:1
module Mux8to1_behavioral(
			   input [7:0] in,
			   input [2:0] sel,
		 	   output reg z);
always @(*)
begin
  case(sel)
	3'b000 : z = in[0];
	3'b001 : z = in[1];
	3'b010 : z = in[2];
	3'b011 : z = in[3];
	3'b100 : z = in[4];
	3'b101 : z = in[5];
	3'b110 : z = in[6];
	3'b111 : z = in[7];
  endcase
end
endmodule


//8:1 Mux using 2:1 Mux  -- Assignment
module Mux8to1(
		input [7:0] in,
		input [2:0] sel,
		output out);
wire w1, w2, w3, w4, w5, w6;
Mux2to1 m1(.in1(in[0]), .in2(in[1]), .sel(sel[2]), .y(w1));
Mux2to1 m2(.in1(in[0]), .in2(in[1]), .sel(sel[2]), .y(w2));
Mux2to1 m3(.in1(in[0]), .in2(in[1]), .sel(sel[2]), .y(w3));
Mux2to1 m4(.in1(in[0]), .in2(in[1]), .sel(sel[2]), .y(w4));
Mux2to1 m5(.in1(w1), .in2(w2), .sel(sel[1]), .y(w5));
Mux2to1 m6(.in1(w3), .in2(w4), .sel(sel[1]), .y(w6));
Mux2to1 m7(.in1(w5), .in2(w6), .sel(sel[0]), .y(out));
endmodule
