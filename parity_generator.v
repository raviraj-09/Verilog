// parity generator
module parity_generator(
	input A,B,C,
	output P_even, P_odd);
assign P_even = A^B^C;
assign P_odd = ~P_even;
endmodule
