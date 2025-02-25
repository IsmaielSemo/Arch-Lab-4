`timescale 1ns / 1ps

module tb_RegisterFile;
    reg clk;
    reg reset;
    reg RegWrite;
    reg [4:0] read_addr1;
    reg [4:0] read_addr2;
    reg [4:0] write_addr;
    reg [31:0] write_data;
    wire [31:0] read_data1;
    wire [31:0] read_data2;
    

    Register_Reset uut (
        .clk(clk),
        .reset(reset),
        .RegWrite(RegWrite),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .write_addr(write_addr),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );
 
    always begin
        #10 clk = ~clk; 
    end
    
    initial begin
    
        clk = 0;
        reset = 0;
        RegWrite = 0;
        read_addr1 = 5'b00000;
        read_addr2 = 5'b00001;
        write_addr = 5'b00010;
        write_data = 32'h12345678;
        
        
        #10 reset = 1;
        #10 reset = 0;

       
        #10 RegWrite = 1;
        write_addr = 5'b00010;  
        write_data = 32'hDEADBEEF; 
        #10 RegWrite = 0; 
        
       
        #10 read_addr1 = 5'b00010;  
        #10 read_addr2 = 5'b00000;  
        
      
        #10 $display("Read Data 1: %h", read_data1);
        #10 $display("Read Data 2: %h", read_data2);
        
        
        #10 $finish;
    end
endmodule
