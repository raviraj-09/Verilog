module T_Flipflop (
	input T, clk,
	output reg Q, Q_bar);
initial 
  begin 
   Q = 0;
  end

always @ (posedge clk)
  begin 
    if (T == 0)
	Q <= Q;
    else
	Q <= ~Q;
  end
assign Q_bar = ~Q;
endmodule
