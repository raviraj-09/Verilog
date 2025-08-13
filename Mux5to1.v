// Mux 5:1  --  Assignment
module mux5to1_behav (
    input [4:0] in,       // 5 input lines
    input [2:0] sel,      // 3-bit select line (only values 0 to 4 valid)
    output reg out
);

always @(*) begin
    case (sel)
        3'd0: out = in[0];
        3'd1: out = in[1];
        3'd2: out = in[2];
        3'd3: out = in[3];
        3'd4: out = in[4];
        default: out = 1'b0; // default case for sel > 4
    endcase
end

endmodule

module mux5to1_dataflow (
    input [4:0] in,
    input [2:0] sel,
    output out
);

assign out = (sel == 3'd0) ? in[0] :
             (sel == 3'd1) ? in[1] :
             (sel == 3'd2) ? in[2] :
             (sel == 3'd3) ? in[3] :
             (sel == 3'd4) ? in[4] : 1'b0;

endmodule


module mux5to1_struct (
    input [4:0] in,       // 5 input lines: in[0] to in[4]
    input [2:0] sel,      // 3-bit select line (only values 0 to 4 are valid)
    output out
);

    wire n0, n1, n2;         // inverted select lines
    wire y0, y1, y2, y3, y4; // output of each AND gate

    // Invert the select lines
    not (n0, sel[0]);
    not (n1, sel[1]);
    not (n2, sel[2]);

 
    and (y0, in[0], n2, n1, n0);
    and (y1, in[1], n2, n1, sel[0]);
    and (y2, in[2], n2, sel[1], n0);
    and (y3, in[3], n2, sel[1], sel[0]);
    and (y4, in[4], sel[2], n1, n0);
    or (out, y0, y1, y2, y3, y4);

endmodule

