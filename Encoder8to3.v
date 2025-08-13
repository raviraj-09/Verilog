// octal to binary encoder
module Encoder8to3(
		   input [7:0] d,
		   output reg [2:0] out);
always@(*)
  begin
    case(d)
	8'b00000001 : out = 3'b000;
	8'b00000010 : out = 3'b001;
	8'b00000100 : out = 3'b010;
	8'b00001000 : out = 3'b011;
	8'b00010000 : out = 3'b100;
	8'b00100000 : out = 3'b101;
	8'b01000000 : out = 3'b110;
	8'b10000000 : out = 3'b111;
	default : out = 3'b000;
    endcase
  end
endmodule

module Encoder8to3_dataflow(
			    input [7:0] d,
			    output[2:0] y);
assign y[0] = d[1] | d[3] | d[5] | d[7];
assign y[1] = d[2] | d[3] | d[6] | d[7];
assign y[2] = d[4] | d[5] | d[6] | d[7];
endmodule


module Encoder8to3_structure(
			    input [7:0] d,
			    output[2:0] y);
or(y[0], d[1], d[3], d[5], d[7]);
or(y[1], d[2], d[3], d[6], d[7]);
or(y[2], d[4], d[5], d[6], d[7]);
endmodule
