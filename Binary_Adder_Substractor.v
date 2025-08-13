module Binary_Adder_Substractor (input [3:0]a,
		   		 input [3:0]b,
		   		 input M,
		   		 output [3:0]S,
		   		 output carryout);
wire [3:0]xor_result;
assign xor_result = b^M;
Binary_Adder BA (.a(a), .b(xor_result), .Cin(M), .S(S), .Carryout(carryout));
endmodule
