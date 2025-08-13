//Decoder  3*8
module decoder3to8 (		//behavioral
	input [2:0] d,
	output reg [7:0] y);
always@(*)
  begin 
    case(d)
	3'b000 : y = 8'b00000001;
	3'b001 : y = 8'b00000010;
	3'b010 : y = 8'b00000100;
	3'b011 : y = 8'b00001000;
	3'b100 : y = 8'b00010000;
	3'b101 : y = 8'b00100000;
	3'b110 : y = 8'b01000000;
	3'b111 : y = 8'b10000000;
    endcase
  end 
endmodule


module decoder3to8_dataflow(
	input [2:0] d,
	output [7:0] y);

assign y[0] = ~d[0] & ~d[1] & ~d[2];
assign y[1] = ~d[0] & ~d[1] &  d[2];
assign y[2] = ~d[0] &  d[1] & ~d[2];
assign y[3] = ~d[0] &  d[1] &  d[2];
assign y[4] =  d[0] & ~d[1] & ~d[2];
assign y[5] =  d[0] & ~d[1] &  d[2];
assign y[6] =  d[0] &  d[1] & ~d[2];
assign y[7] =  d[0] &  d[1] &  d[2];
endmodule


module decoder3to8_structure (
	input [2:0] d,
	output [7:0] y);

//   creating internal wire to inver d input
wire [2:0] d_not;
not(d_not[0], d[0]);
not(d_not[1], d[1]);
not(d_not[2], d[2]);

and(y[0], d_not[0], d_not[1], d_not[2]);
and(y[1], d_not[0], d_not[1], d[2]);
and(y[2], d_not[0], d[1],     d_not[2]);
and(y[3], d_not[0], d[1],     d[2]);
and(y[4], d[0],     d_not[1], d_not[2]);
and(y[5], d[0],     d_not[1], d[2]);
and(y[6], d[0],     d[1],     d_not[2]);
and(y[7], d[0],     d[1],     d[2]);
endmodule
