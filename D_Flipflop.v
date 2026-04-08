module D_Flipflop (
    input D,
    input clk,
    input rst,   // active low reset
    output reg Q,
    output Q_bar
);

    always @(posedge clk or negedge rst) begin        // asynchronuous reset
    if (!rst)
        Q <= 1'b0;
    else
        Q <= D;
end

assign Q_bar = ~Q;

endmodule
