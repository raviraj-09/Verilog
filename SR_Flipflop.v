module SR_Flipflop (
	input S, R,
	input clk, rst,
	output reg q,
	output reg q_bar);

// always @ (posedge clk or negedge rst) // for asynchronous reset
always @ (posedge clk)
  begin 
    if(!rst)
    q <= 0;
  else begin
	case({S,R})
	   2'b00 : q <= q;
	   2'b01 : q <= 0;
	   2'b10 : q <= 1;
	   2'b11 : q <= 1'bx;
	 default : q <= q;
	endcase
       end
  end
assign q_bar = ~q;
endmodule
