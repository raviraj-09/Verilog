// 3-bit Ripple DOWN Counter using T Flip-Flops
/* Asynchronous Counter 3-bit 
   Up Counter 7->6->5->4->3->2->1->0->7...
   Positive edge triggered*/

module RippleDownCounter3bit(clk, count);
  input clk;
  output [2:0] count;
  wire [2:0] Q_bar;

  T_Flipflop T0(1'b1, clk, 	Q_bar[0],   count[0]);    // LSB toggles on clk
  T_Flipflop T1(1'b1, count[0], Q_bar[1],   count[1]);    // Q1 toggles on Q0 ?
  T_Flipflop T2(1'b1, count[1], Q_bar[2],   count[2]);    // Q2 toggles on Q1 ?
endmodule

