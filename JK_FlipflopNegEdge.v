// JK Flip-Flop with asynchronous reset and enable control
module JK_FF(
  input J, K,           // JK inputs
  input clk,            // Clock input (negative-edge triggered)
  input reset,          // Asynchronous reset (active-high)
  input enable,         // Enable signal to control toggling
  output reg Q,         // Flip-flop output
  output Q_bar          // Complemented output
);

  // Complement output
  assign Q_bar = ~Q;

  // Flip-Flop behavior
  always @(negedge clk or posedge reset) begin
    if (reset)
      Q <= 1'b0;               // Reset output to 0 when reset is high
    else if (enable) begin     // Toggle only if enable is high
      case ({J, K})
        2'b00: Q <= Q;         // No change
        2'b01: Q <= 1'b0;      // Reset
        2'b10: Q <= 1'b1;      // Set
        2'b11: Q <= ~Q;        // Toggle
      endcase
    end
    // If enable is low, hold current state
  end

endmodule

