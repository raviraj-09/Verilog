//Mux 2:1
module Mux2to1(input in1, in2, sel, output y);
assign y = (sel) ? in2:in1;
endmodule

module Mux2to1_structural(input in1, in2, sel, output z);
wire x,y;
and(x, in1, ~sel);
and(y, in2, sel);
or(z, x, y);
endmodule 