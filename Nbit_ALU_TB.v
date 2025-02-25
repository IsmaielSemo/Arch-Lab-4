`timescale 1ns / 1ps


module Nbit_ALU_TB();

localparam clk_period = 100;
parameter N=32;

reg clk;
reg [N-1:0] A , B;
reg [3:0] sel ;
wire [N-1:0] result ;
wire zero_flag;
NBitALU_ZeroFlag #(32) dut(clk, A , B, sel,  result ,  zero_flag);


initial begin 
    clk = 1'b0;
    forever #(clk_period/2) clk=~clk;
end

//wire [N-1:0] ADD,SUB,OR,AND;
//wire flag;
// ADD = A+B;
//assign SUB = A-B;
// OR = A|B;
//assign AND = A&B;
//assign flag = (ADD == result)?

initial begin 
         A = 32'b00000000000000000000000000001010;
         B = 32'b00000000000000000000000000001100;
        sel = 4'b0000;
        
        #clk_period 
        
         A = 32'b00000000000000000000000000001010;
         B = 32'b00000000000000000000000000001100;
        sel = 4'b0001;
        
        #clk_period 
        
         A = 32'b00000000000000000000000000001010;
         B = 32'b00000000000000000000000000001100;
        sel = 4'b0000;
         
         #clk_period 
         A = 32'b00000000000000000000000000001010;
         B = 32'b00000000000000000000000000001100;
        sel = 4'b0010;
         
        #clk_period 
        
        A = 32'b00000000000000000000000000001010;
         B = 32'b00000000000000000000000000001100;
        sel = 4'b0110;
         #clk_period 
        
        A = 32'b00000000000000000000000000001010;
         B = 32'b00000000000000000000000000001100;
        sel = 4'b1111;
        #clk_period 
        
         A = 32'b00000000000000000000000000000000;
         B = 32'b00000000000000000000000000000000;
        sel = 4'b0000;
        
        
    end 

endmodule
