module Binary_Substractor(input [3:0]a,
		    input [3:0]b,
		    input Cin,
		    output [3:0]S,
		    output Carryout);
wire temp1, temp2, temp3;
Full_Adder FA1(.A(a[0]), .B(~b[0]),  .Cin(Cin),   .Sum(S[0]), .Cout(temp1));
Full_Adder FA2(.A(a[1]), .B(~b[1]), .Cin(temp1), .Sum(S[1]), .Cout(temp2));
Full_Adder FA3(.A(a[2]), .B(~b[3]), .Cin(temp2), .Sum(S[2]), .Cout(temp3));
Full_Adder FA4(.A(a[3]), .B(~b[3]), .Cin(temp3), .Sum(S[3]), .Cout(Carryout));
endmodule

module Binary_Substractor1(input [3:0]a,
		    input [3:0]b,
		    input Cin,
		    output [3:0]S,
		    output Carryout);
wire invert_b = ~b;
Binary_Adder BA (.a(a), .b(invert_b), .Cin(Cin), .S(S), .Carryout(Carryout));
endmodule