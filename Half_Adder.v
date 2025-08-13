module Half_Adder_Structure(input A,B, output Sum, Carry);
xor(Sum,A,B); 	   // using primitve gates
and(Carry,A,B);	   // since this is structural
endmodule

module Half_Adder_Data_Flow(input A, B, output Sum, Carry);
assign Sum = A^B;	// using assign operator
assign Carry = A&B;
endmodule

module Half_Adder_Behavioral(A,B,Sum,Carry);
input wire A,B;
output reg Sum, Carry;
always@(A or B)
begin
Sum = A^B;
Carry = A&B;
end
endmodule