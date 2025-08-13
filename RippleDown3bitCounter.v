/* Asynchronous Counter 3-bit 
   Down Counter 0->7->6->5->4->3->2->1->0-->7...
   Positive edge triggered*/

module RippleDown3bitCounter(clk, count);
  input clk;
  output [2:0] count;
  wire [2:0] Q;

T_Flipflop T0(1, clk, count[0], Q[0]);   // T, Clk, Q, Q_bar
T_Flipflop T1(1, Q[0], count[1],Q[1] );
T_Flipflop T2(1, Q[1], count[2], Q[2]);
endmodule


