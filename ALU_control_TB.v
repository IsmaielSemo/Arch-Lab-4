`timescale 1ns / 1ps


module tb_ALUControlUnit;


reg [1:0] ALUOp;       
reg [2:0] Inst_14_12;  
reg Inst_30;          
wire [3:0] ALUCtrl;    


ALUControlUnit ACU (
    .ALUOp(ALUOp),
    .Inst_14_12(Inst_14_12),
    .Inst_30(Inst_30),
    .ALUCtrl(ALUCtrl)
);

initial begin
 
    $display("Time\tALUOp Inst_14_12 Inst_30 ALUCtrl");

    // ALUOp = 00 (ADD)
    ALUOp = 2'b00; Inst_14_12 = 3'b000; Inst_30 = 1'b0; #10;
    $display("%0t\t%b\t%b\t%b\t%b", $time, ALUOp, Inst_14_12, Inst_30, ALUCtrl);

    //  ALUOp = 01 (SUB)
    ALUOp = 2'b01; Inst_14_12 = 3'b000; Inst_30 = 1'b0; #10;
    $display("%0t\t%b\t%b\t%b\t%b", $time, ALUOp, Inst_14_12, Inst_30, ALUCtrl);

    // ALUOp = 10, Inst_14_12 = 000, Inst_30 = 0 (ADD)
    ALUOp = 2'b10; Inst_14_12 = 3'b000; Inst_30 = 1'b0; #10;
    $display("%0t\t%b\t%b\t%b\t%b", $time, ALUOp, Inst_14_12, Inst_30, ALUCtrl);

    // ALUOp = 10, Inst_14_12 = 000, Inst_30 = 1 (SUB)
    ALUOp = 2'b10; Inst_14_12 = 3'b000; Inst_30 = 1'b1; #10;
    $display("%0t\t%b\t%b\t%b\t%b", $time, ALUOp, Inst_14_12, Inst_30, ALUCtrl);

    // ALUOp = 10, Inst_14_12 = 111 (AND)
    ALUOp = 2'b10; Inst_14_12 = 3'b111; Inst_30 = 1'b0; #10;
    $display("%0t\t%b\t%b\t%b\t%b", $time, ALUOp, Inst_14_12, Inst_30, ALUCtrl);

    // ALUOp = 10, Inst_14_12 = 110 (OR)
    ALUOp = 2'b10; Inst_14_12 = 3'b110; Inst_30 = 1'b0; #10;
    $display("%0t\t%b\t%b\t%b\t%b", $time, ALUOp, Inst_14_12, Inst_30, ALUCtrl);

 
    $finish;
end

endmodule
