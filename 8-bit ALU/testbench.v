// Testbench
`timescale 1ns/1ps

module alu_8bit_tb;
    // Inputs
    reg clock;
    reg reset;
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] ALU_Sel;
    
    // Outputs
    wire [7:0] ALU_Out;
    wire CarryOut;
    
    // Instantiate the Unit Under Test (UUT)
    alu_8bit uut (
        .clock(clock),
        .reset(reset),
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut)
    );
    
    // Clock generation
    always #5 clock = ~clock;
    
    // Test cases
    initial begin
        // Initialize signals
        clock = 0;
        reset = 0;
        A = 0;
        B = 0;
        ALU_Sel = 4'b0000;
        
        // Reset Test Cases
        $display("Reset Test Cases");
        reset = 1; #10;
      if (ALU_Out !== 8'b0 || CarryOut !== 1'b0)
            $error("Reset failed: Outputs not zero");
        reset = 0;
        
        // Addition Test Cases
        $display("Addition Test Cases");
        ALU_Sel = 4'b0000;
        A = 8'd50; B = 8'd25; #10;
      if (ALU_Out !== 8'd75 || CarryOut !== 1'b0)
            $error("Addition test failed: 50 + 25");
        
        A = 8'hFF; B = 8'hFF; #10;
        if (ALU_Out !== 8'hFE || CarryOut !== 1'b1)
            $error("Addition overflow test failed");
        
        A = 8'd100; B = 8'd0; #10;
        if (ALU_Out !== 8'd100 || CarryOut !== 1'b0)
            $error("Addition with zero test failed");
        
        // Subtraction Test Cases
        $display("Subtraction Test Cases");
        ALU_Sel = 4'b0001;
        A = 8'd75; B = 8'd25; #10;
        if (ALU_Out !== 8'd50)
            $error("Subtraction test failed: 75 - 25");
        
        A = 8'd100; B = 8'd0; #10;
        if (ALU_Out !== 8'd100)
            $error("Subtraction with zero test failed");
        
        A = 8'd50; B = 8'd50; #10;
        if (ALU_Out !== 8'd0)
            $error("Subtraction of equal numbers failed");
        
        // Multiplication Test Cases
        $display("Multiplication Test Cases");
        ALU_Sel = 4'b0010;
        A = 8'd10; B = 8'd5; #10;
        if (ALU_Out !== 8'd50)
            $error("Multiplication test failed: 10 * 5");
        
        A = 8'd100; B = 8'd1; #10;
        if (ALU_Out !== 8'd100)
            $error("Multiplication by 1 failed");
        
        A = 8'd100; B = 8'd0; #10;
        if (ALU_Out !== 8'd0)
            $error("Multiplication by 0 failed");
        
        // Division Test Cases
        $display("Division Test Cases");
        ALU_Sel = 4'b0011;
        A = 8'd50; B = 8'd5; #10;
        if (ALU_Out !== 8'd10)
            $error("Division test failed: 50 / 5");
        
        A = 8'd100; B = 8'd1; #10;
        if (ALU_Out !== 8'd100)
            $error("Division by 1 failed");
        
        A = 8'd100; B = 8'd0; #10;
        if (ALU_Out !== 8'hAC)
            $error("Division by zero handling failed");
        
        // Invalid Operation Test Case
        $display("Invalid Operation Test Case");
        ALU_Sel = 4'b1111; #10;
        if (ALU_Out !== 8'hAC)
            $error("Invalid operation handling failed");
        
        // Consecutive Operations Test
        $display("Consecutive Operations Test");
        ALU_Sel = 4'b0000; A = 8'd10; B = 8'd5; #10; // Addition
        ALU_Sel = 4'b0001; A = 8'd20; B = 8'd7; #10; // Subtraction
        if (ALU_Out !== 8'd13)
            $error("Consecutive operations test failed");
        
        $display("All test cases completed.");
        $finish;
    end
endmodule
