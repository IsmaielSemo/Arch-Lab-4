`timescale 1ns / 1ps


module tb_ControlUnit();

reg [4:0] Inst; 
wire Branch;     
wire MemRead;   
wire MemtoReg;  
wire [1:0] ALUOp;  
wire MemWrite;  
wire ALUSrc;     
wire RegWrite;   


ControlUnit CU (
    .Inst(Inst),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
);

initial begin

 
    Inst = 5'b01100;  // R-Format opcode
    #10;
    
    Inst = 5'b00000;  // LW opcode
    #10; 
    
    Inst = 5'b01000;  
    #10; 

    Inst = 5'b11000;  // BEQ opcode
    #10; 

    Inst = 5'b11111;  // Unknown opcode
    #10; 
  
end

endmodule
