module Full_Substractor(input A, B, bin, output Dif, Bow);
wire temp1, bo1, bo2;
Half_Substractor HS1(.A(A), .B(B), .dif(temp1), .bow(bo1));
Half_Substractor HS2(.A(temp1), .B(bin), .dif(Dif), .bow(bo2));
assign Bow = bo1|bo2;
endmodule
