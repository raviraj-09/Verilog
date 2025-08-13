// mod (N) Counter

module modNcounter #(parameter n = 5)(
	input clk, rst, up_down,
	output reg[3:0] count);
always @(posedge clk or negedge rst)
  begin 
    if(!rst)	//reset
	count <= 0;
    else if(up_down)	// up counter
      begin	//If maximum value reached then it should automatically reset to 0
	if(count == n-1) 	// max. value
	    count <= 0;
	else
	    count <= count + 1;
      end
    else
      begin
	if(count == 0)
	  count <= n-1;	//max. value
	else
	  count <= count - 1;
      end
  end
endmodule