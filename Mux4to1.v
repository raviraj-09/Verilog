// MUX 4:1
module Mux4to1(input [3:0] in, [1:0]sel, output reg z);
always @ (*)    // (*) -->  All inputs
begin
case(sel)
2'b00 : z = in[0];
2'b01 : z = in[1];
2'b10 : z = in[2];
2'b11 : z = in[3];
default : z = 1'bx;   // compulsary to add default, otherwise it go to latch state
endcase
end
endmodule


module Mux4to1_dataflow(input [3:0]i, [1:0]sel, output reg z);
assign z = ((~sel[0] & ~sel[1] & i[0]) | (~sel[0] & sel[1] & i[1]) |
	     (sel[0] & ~sel[1] & i[2]) |  (sel[0] & sel[1] & i[3]));
endmodule