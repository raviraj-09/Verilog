//Arithematic Logic Unit  -- Assignment
module ALU(
        input [7:0] A,B,
    	input [2:0] Op,
    	output [7:0] Result);
    
    //internal variables declared here
    wire [7:0] Reg1,Reg2;
    reg [7:0] Reg3;
    
    //Assign A and B to internal variables for doing operations
    assign Reg1 = A;
    assign Reg2 = B;

    //Assign the output 
    assign Result = Reg3;

    always @(*)
    begin
        case (Op)
            0 : Reg3 = Reg1 + Reg2;     //addition
         1 : Reg3 = Reg1 - Reg2;  	//subtraction
         2 : Reg3 = ~Reg1;  		//NOT operation on reg1
         3 : Reg3 = ~(Reg1 & Reg2); 	//NAND operation 
         4 : Reg3 = ~(Reg1 | Reg2);	//NOR operation               
         5 : Reg3 = Reg1 & Reg2; 	//AND operation
         6 : Reg3 = Reg1 | Reg2; 	//OR operation  
         7 : Reg3 = Reg1 ^ Reg2;	//XOR operation 
        endcase 
    end
    
endmodule