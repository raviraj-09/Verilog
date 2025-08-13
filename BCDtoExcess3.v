// BCD to Excess-3
module BCDtoEcxess_3(
	input A, B, C, D,
	output W, X, Y, Z);
assign W = A | (B&D) | (B&C);
assign X = ((~B)&D) | ((~B)&C) | (B&(~C)&(~D));
assign Y = (C&D) | ((~C)&(~D));
assign Z = ~D;
endmodule


//Excess-3 to BCD
module Excess_3toBCD(
	input W, X, Y, Z,
	output A, B, C, D);
assign A = (W&X) | (W&X&Y);
assign B = ((~X)&(~Y)) | ((~X)&(~Z)) | (X&Y&Z);
assign C = ((~Y)&Z) | (Y&(~Z));
assign D = ~Z;
endmodule 