// Synchronous Up - Down Counter using Up_Down Mode
module SyncUpDownCounter(
	input clk, rst, up_down,
	output reg [3:0] count);

always @(posedge clk)
  begin
    if(up_down) // up_down = 1 --> Up counter
      begin
	if(!rst)
	  count <= 4'b0000;
	else
	  count <= count + 1;
	end
    else 
	if(!rst)
	  count <= 4'b1111;
	else
	  count <= count - 1;

  end
endmodule
	