`timescale 1ns / 1ps


module tb_ALUControlUnit;


reg [1:0] ALUOp;       
reg [2:0] Inst_14_12;  
reg Inst_30;          
wire [3:0] ALU_sel ;    


ALUControlUnit ACU (
    .ALUOp(ALUOp),
    .Inst_14_12(Inst_14_12),
    .Inst_30(Inst_30),
    .ALU_sel (ALU_sel )
);

initial begin
 
   
    ALUOp = 2'b00; Inst_14_12 = 3'b000; Inst_30 = 1'b0; #10;

  
    ALUOp = 2'b01; Inst_14_12 = 3'b000; Inst_30 = 1'b0; #10;

   
    ALUOp = 2'b10; Inst_14_12 = 3'b000; Inst_30 = 1'b0; #10;

  
    ALUOp = 2'b10; Inst_14_12 = 3'b000; Inst_30 = 1'b1; #10;

  
    ALUOp = 2'b10; Inst_14_12 = 3'b111; Inst_30 = 1'b0; #10;

 
    ALUOp = 2'b10; Inst_14_12 = 3'b110; Inst_30 = 1'b0; #10;
 

end

endmodule
