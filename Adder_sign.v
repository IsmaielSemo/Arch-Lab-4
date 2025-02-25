`timescale 1ns / 1ps

module FA(
    input a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule

module exp3_signed_Add #(parameter N=32) (
    input clk,
    input [N-1:0] a, b,
    output [N-1:0] out,
    output co
);
    wire [N:0] cout;        
    wire [N-1:0] a_neg, b_neg;
    wire sign_out;
    wire overflow;
    assign cout[0] = 1'b0;
    //assign a_neg = (a[N-1] == 1) ? (~a + 1) : a;  
   // assign b_neg = (b[N-1] == 1) ? (~b + 1) : b;  
    assign sign_out = (a[N-2:0] > b[N-2:0] && a[N-1]==1 && b[N-1]==0)? 1:
            (b[N-2:0] > a[N-2:0] && b[N-1]==1 && a[N-1]==0)? 1:
            (a[N-1] == 1 && b[N-1]==1)? 1:0;
   
    genvar i;
    generate
        for (i = 0; i <= N-2; i = i + 1) begin
            FA fa(a[i], b[i], cout[i], out[i], cout[i+1]);
        end
    endgenerate

    assign out[N-1] = sign_out;  
    assign co = cout[N-1];

    //exp2_negative_7seg (clk, {4'b00000, out}, Anode, LED_out);

endmodule

module mux16x1 #(parameter N=32)(
    input [N-1:0] AND,OR,ADD,SUB, // 16-bit input data
    input [3:0] sel,       // 4-bit select signal
    output reg [N-1:0]  out         // Output
);

always @(*) begin
    case(sel)
        4'b0000: out = AND;
        4'b0001: out = OR;
        4'b0010: out = ADD;
        4'b0110: out = SUB;     
        default: out = N-1'b0;  // Default case
    endcase
end
endmodule

module mux2x1(
input a,b,sel, 
output out
);

assign out = (sel==1)? a:b;
endmodule

module Nbit_2x1mux #(parameter N=32)(
input [N-1:0] a,b,
input sel,
output [N-1:0] out
    );
    genvar i;
    generate 
    for(i=0;i<N;i=i+1)begin 
        mux2x1 mux(a[i],b[i], sel, out[i] );
    end
  endgenerate
endmodule
