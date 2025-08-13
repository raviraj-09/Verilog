// Synchronous Up Counter
module SynchronousUpCounter(
	input clk, reset,
	output reg [3:0] count);
always@(posedge clk or negedge reset)
  begin
    if(!reset)
	count <= 4'b0000;
    else
	count <= count + 1'b1;
  end
endmodule
