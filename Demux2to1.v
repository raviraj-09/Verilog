//Demux 1:2
module Demux1to2 (input in, sel, output reg y0,y1);
assign {y0,y1} = (sel) ? {in, 1'b0} : {1'b0, in};
endmodule