module Full_Adder_DataFlow(input A,B,Cin, output Sum, Cout);
assign Sum = A ^ B ^ Cin;
assign Cout = A&B | Cin&(A^B);
endmodule

// using module instantiation

module Full_Adder(input in1, in2, Cin, output SumF, Carryout);
wire temp1, temp2, temp3;
Half_Adder_Data_Flow Ha1(.A(in1), .B(in2), .Sum(temp1), .Carry(temp2));
Half_Adder_Data_Flow Ha2(.A(temp1), .B(Cin), .Sum(SumF), .Carry(temp3));
assign Carryout = temp2 | temp3;
endmodule