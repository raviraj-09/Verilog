// ALU design 
module alu_8bit (
    input wire clock,
    input wire reset,
    input wire [7:0] A,
    input wire [7:0] B,
    input wire [3:0] ALU_Sel,
    output reg [7:0] ALU_Out,
    output reg CarryOut
);

    // Internal signals for intermediate calculations
    reg [8:0] sum_result;
    reg signed [8:0] sub_result;
    reg [15:0] mul_result;
    reg [7:0] div_result;
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            // Reset condition: set outputs to 0
            ALU_Out <= 8'b0;
            CarryOut <= 1'b0;
        end else begin
            // Operation selection based on ALU_Sel
            case (ALU_Sel)
                4'b0000: begin // Addition
                    sum_result = {1'b0, A} + {1'b0, B};
                    ALU_Out <= sum_result[7:0];
                    CarryOut <= sum_result[8];
                end
                
                4'b0001: begin // Subtraction
                    sub_result = {1'b0, A} - {1'b0, B};
                    ALU_Out <= sub_result[7:0];
                    CarryOut <= 1'b0; // No carry out for subtraction
                end
                
                4'b0010: begin // Multiplication
                    mul_result = A * B;
                    ALU_Out <= mul_result[7:0];
                    CarryOut <= 1'b0;
                end
                
                4'b0011: begin // Division
                    if (B == 8'b0) begin
                        // Division by zero
                        ALU_Out <= 8'hAC;
                        CarryOut <= 1'b0;
                    end else begin
                        div_result = A / B;
                        ALU_Out <= div_result;
                        CarryOut <= 1'b0;
                    end
                end
                
                default: begin // Invalid operation
                    ALU_Out <= 8'hAC;
                    CarryOut <= 1'b0;
                end
            endcase
        end
    end
endmodule
