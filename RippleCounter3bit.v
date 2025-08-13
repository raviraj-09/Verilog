/* Asynchronous Counter 3-bit 
   Up Counter 0->1->2->3->4->5->6->7->0...
   Positive edge triggered*/

module RippleCounter3bit(clk, count);
  input clk;
  output [2:0] count;
  wire [2:0] Q_bar;

T_Flipflop T0(1, clk, count[0], Q_bar[0]);
T_Flipflop T1(1, Q_bar[0], count[1], Q_bar[1]);
T_Flipflop T2(1, Q_bar[1], count[2], Q_bar[2]);
endmodule


