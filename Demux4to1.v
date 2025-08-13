module Demux1to4_behavioral(
		input in, [1:0]sel, 
		output reg [3:0]y);
always @(*)
  begin 
	case(sel)
		2'b00 : {y[0],y[1],y[2],y[3]} = {in, 3'b0};
		2'b01 : {y[0],y[1],y[2],y[3]} = {1'b0, in, 2'b0};
		2'b10 : {y[0],y[1],y[2],y[3]} = {2'b0, in, 1'b0};
		2'b11 : {y[0],y[1],y[2],y[3]} = {in, 3'b0};
		default : {y[0],y[1],y[2],y[3]} = {3'b0};
	endcase
  end
endmodule


module Demux1to4_ifelse( 
			input in,
			input [1:0] sel,
			output reg [3:0] y);
always@(*)
begin 
if(in && sel == 2'b00)
	y = 4'b0001;
else if(in && sel == 2'b01)
	y = 4'b0010;
else if(in && sel == 2'b10)
	y = 4'b0100;
else if(in && sel == 2'b11)
	y = 4'b1000;
else
	y = 4'b0000;
end
endmodule
 
