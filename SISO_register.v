//Serial In Serial Out Shift Register
/*
module SISO_register (
	input clk, rst, si,
	output reg so);
reg [3:0] temp;
always @(posedge clk or negedge rst)
  begin
    if(!rst)
	temp <= 4'b0000; // for resetting shift register
    else
      begin
	// temp <= temp << 1;  shift left and input new bit
	temp <= temp >> 1;   //shift right and input new bit
	temp[0] <= si;	//input the MSB
	so <= temp[3]; 	// output the LSB
      end
  end
endmodule
*/

module SISO_register (
    input clk, rst, si,
    output reg so);
  
  reg [3:0] temp;

  always @(posedge clk or negedge rst) begin
    if (!rst)
      temp <= 4'b0000;
    else begin
      temp <= {si, temp[3:1]};  // right shift and insert si into MSB
    end
  end

  always @(*) begin
    so = temp[0];  // output the LSB after shift
  end

endmodule
