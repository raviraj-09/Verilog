module D_Flipflop (
	input D,
	input clk, rst,
	output reg Q, Q_bar);
always @(posedge clk)
  begin
    if(!rst)
	Q <= 0;
    else if(D==0)
	Q <= 0;
    else 
	Q <= 1;
  end
assign Q_bar = ~Q;
endmodule

