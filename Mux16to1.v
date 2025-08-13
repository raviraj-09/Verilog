// mUx 16:1
module Mux16to1_behavioral(
			   input [15:0] in,
			   input [3:0] sel,
			   output reg z);

//instantiating the moduke by order list to Mux8to1

Mux8to1_behavioral Mux1(in[7:0],sel[2:0], z); // for select line 0 to 7 
Mux8to1_behavioral Mux2(in[15:8],sel[2:0],z); // for select line 8 to 15
endmodule