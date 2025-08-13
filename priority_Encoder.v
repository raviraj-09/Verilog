//priority encooder
module priority_encoder(
  input [7:0] D,
  output reg [2:0] y);
  
  always@(D) begin
    casex(D)
      8'b1xxxxxxx: y = 3'b111;
      8'b01xxxxxx: y = 3'b110;
      8'b001xxxxx: y = 3'b101;
      8'b0001xxxx: y = 3'b100;
      8'b00001xxx: y = 3'b011;
      8'b000001xx: y = 3'b010;
      8'b0000001x: y = 3'b001;
      8'b00000001: y = 3'b000;
      default: 	   y = 3'bxxx;
    endcase
  end
endmodule

/*The priority encoder overcome the drawback of binary encoder that 
generates invalid output for more than one input line is set to high. 
The priority encoder prioritizes each input line and provides an encoder
 output corresponding to its highest input priority. */