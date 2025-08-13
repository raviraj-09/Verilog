module SR_latch( 
	input wire s, r,
	output wire q, q0);

assign q = ~(r|q0);
assign q0 = ~(s|q);
endmodule
