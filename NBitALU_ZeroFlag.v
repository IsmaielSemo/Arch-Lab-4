`timescale 1ns / 1ps

module NBitALU_ZeroFlag #(parameter N = 32)(
input clk,
input [N-1:0] A,
input [N-1:0] B,
input  [3:0] sel,
output  [N-1:0] result ,
output  zero_flag
);

wire [N-1:0] Bf;
Nbit_2x1mux#(32) mux(~B+1,B,sel[2],Bf);
wire [N-1:0] ADD_SUB ;
wire cout;

exp3_signed_Add #(32) adder( clk, A, Bf, ADD_SUB, cout);

wire [N-1:0] AND;
assign AND = A&B;
wire [N-1:0] OR;
assign OR = A | B;

mux16x1 #(32) mux6(AND,OR,ADD_SUB,ADD_SUB,sel,result);
assign zero_flag = (result == 0)?1'b1: 1'b0;

endmodule
