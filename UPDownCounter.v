// 3-bit asynchronous UP/DOWN counter using JK flip-flops
module UpDownCounter3bit(
  input clk,             // Global clock input
  input up_down,         // Mode select: 1 for UP, 0 for DOWN
  input reset,           // Asynchronous reset
  output [2:0] count     // 3-bit counter output
);

  wire [2:0] Q_bar;       // Complemented outputs of the flip-flops
  wire [2:0] enable;      // Enable signals for the flip-flops

  // -------------------------------
  // Enable Logic:
  // Flip-flops toggle only when enable is high.
  // Enable is designed based on the up/down mode:
  // -------------------------------

  assign enable[0] = 1'b1;  // LSB always toggles on every clock

  // FF1 toggles when Q0 = 1 (up) or Q0 = 0 (down)
  assign enable[1] = up_down ? count[0] : ~count[0];

  // FF2 toggles when Q1 & Q0 = 1 (up) or Q1 & Q0 = 0 (down)
  assign enable[2] = up_down ? (count[0] & count[1]) : (~count[0] & ~count[1]);

  // -------------------------------
  // Instantiate 3 JK Flip-Flops with shared clock and reset
  // -------------------------------
  JK_FF FF0(1'b1, 1'b1, clk, reset, enable[0], count[0], Q_bar[0]); // LSB
  JK_FF FF1(1'b1, 1'b1, clk, reset, enable[1], count[1], Q_bar[1]); // Middle bit
  JK_FF FF2(1'b1, 1'b1, clk, reset, enable[2], count[2], Q_bar[2]); // MSB

endmodule

