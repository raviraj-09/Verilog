
module johnson_counter (
    input wire clk,       // Clock input
    input wire reset,     // Asynchronous reset input
    output reg [3:0] q    // 4-bit output
);

// Always block triggered on the rising edge of clock or reset
always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 4'b0000;     // Reset the counter to 0 asynchronously
    end else begin
        q <= {~q[0], q[3:1]}; // Shift and invert
    end
end

endmodule
