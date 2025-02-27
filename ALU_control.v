`timescale 1ns / 1ps


module ALUControlUnit (
    input [1:0] ALUOp,       // ALU operation code
    input [2:0] Inst_14_12,  // Inst[14-12] (function code)
    input Inst_30,           // Inst[30] (bit indicating subtraction)
    output reg [3:0] ALUCtrl // ALU control signal (operation selection)
);

always @(*) begin
    // Default value for ALU control signal (no operation)
    ALUCtrl = 4'b0000;
    
    case (ALUOp)
        2'b00: begin
            // ALUOp = 00 (ADD operation)
            ALUCtrl = 4'b0010;  // ADD
        end
        
        2'b01: begin
            // ALUOp = 01 (SUB operation)
            ALUCtrl = 4'b0110;  // SUB
        end
        
        2'b10: begin
            // ALUOp = 10 (R-type instructions, check Inst[14-12] and Inst[30])
            case (Inst_14_12)
                3'b000: begin
                    // Inst[14-12] = 000, Check Inst[30] for ADD or SUB
                    if (Inst_30 == 1'b0) begin
                        ALUCtrl = 4'b0010;  // ADD
                    end else begin
                        ALUCtrl = 4'b0110;  // SUB
                    end
                end
                3'b111: begin
                    // Inst[14-12] = 111 (AND operation)
                    ALUCtrl = 4'b0000;  // AND
                end
                3'b110: begin
                    // Inst[14-12] = 110 (OR operation)
                    ALUCtrl = 4'b0001;  // OR
                end
                default: begin
                    // Default (in case of unknown opcode)
                    ALUCtrl = 4'b0000;  // Default to AND
                end
            endcase
        end
        
        default: begin
            // Default case for unsupported ALUOp values
            ALUCtrl = 4'b0000;  // Default to AND
        end
    endcase
end

endmodule
