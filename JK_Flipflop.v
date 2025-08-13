module JK_Flipflop(
	input J, K,
	input clk, rst,
	output reg Q, Q_bar);
always@(posedge clk)
  begin
    if(rst == 0)
	Q <= 0;
    else 
    begin
	case({J,K})
	    2'b00 : Q <= Q;
	    2'b01 : Q <= 0;
	    2'b10 : Q <= 1;
	    2'b11 : Q <= ~Q;
	  default : Q <= Q;
	endcase
    end
  end
assign Q_bar = ~Q;
endmodule