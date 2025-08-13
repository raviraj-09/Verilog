
module ring_counter (
    input wire clk,        // Clock input
    input wire reset,      // Asynchronous reset input
    output reg [3:0] q     // 4-bit output
);

// Always block triggered on the rising edge of clock or reset
always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 4'b0001;      // Reset the counter to the initial state
    end else begin
        q <= {q[2:0], q[3]}; // Rotate the bits
    end
end

endmodule
