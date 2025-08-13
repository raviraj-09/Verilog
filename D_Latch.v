module D_latch( 
	input wire D, 
	input wire en,
	output reg q);
always @(*)
   begin
	if(en)
	q = D;
   end
endmodule
	
	
