// Comparator
module comparator(
	input A, B,
	output reg G, L, E); // G: A>B, L: A<B, E: A==B
always@(*)
  begin
  G=0; L=0; E=0;
    if(A>B)
	G = 1'b1;
    else if(A<B)
	L = 1'b1;
    else 
	E = 1'b1;
  end
endmodule