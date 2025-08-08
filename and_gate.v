module and_gate(
	input a, b,
	output y);
assign y = a & b;
endmodule


module andgate_tb();
reg A,B;
wire Y;
//  DUT instantiation
and_gate DUT (.a(A), .b(B), .y(Y));
// stimulus applying and result comparision
initial begin
stimuli_gen_rescmp(1'b0, 1'b0, 1'b0);
stimuli_gen_rescmp(1'b0, 1'b1, 1'b0);
stimuli_gen_rescmp(1'b1, 1'b0, 1'b0);
stimuli_gen_rescmp(1'b1, 1'b1, 1'b1);
end

// initiating task
task stimuli_gen_rescmp;
input A_t, B_t, Y_exp;
begin
A = A_t;
B = B_t;
#10
if(Y_exp != Y)
$display("ERROR! When A = %0d, B = %0d, Y = %0d",A,B,Y);
else
$display("INFO! When A = %0d, B = %0d, Y = %0d",A,B,Y);
end
endtask
endmodule

