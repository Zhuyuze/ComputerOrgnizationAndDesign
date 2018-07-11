`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  
// 
// Create Date: 2018/06/22 10:15:51
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
	input ALUSrcA, 
	input ALUSrcB, 
	input [2:0] ALUOp, 
	input [31:0] ADROut, 
	input [4:0] sa, 
	input [31:0] BDROut, 
	input [31:0] ExtOut, 
	output reg zero, 
	output reg [31:0] result
	);
    
    wire [31:0] ALUa;
    wire [31:0] ALUb;
    assign ALUa = (ALUSrcA == 0) ? ADROut : sa;
    assign ALUb = (ALUSrcB == 0) ? BDROut : ExtOut;
    always@(ALUOp or ALUa or ALUb or ALUSrcA or ALUSrcB) begin
        case(ALUOp)
            3'b000: begin
                result = ALUa + ALUb;
            end
            3'b001: begin
                result = ALUa - ALUb;
            end
            3'b010: begin 
                if (ALUa < ALUb && ((ALUa[31] == 0 && ALUb[31] == 0) || (ALUa[31] == 1 && ALUb[31] == 1)))
                    result = 1;
                else if (ALUa[31] == 0 && ALUb[31] == 1)
                    result = 0;
                else if (ALUa[31] == 1 && ALUb[31] == 0)
                    result = 1;
                else
                    result = 0;
            end
            3'b011: begin
                result = (ALUa < ALUb) ? 1 : 0;
            end
            3'b100: begin
                result = ALUb << ALUa;
            end
            3'b101: begin
                result = ALUa | ALUb;
            end
            3'b110: begin
                result = ALUa & ALUb;
            end
            3'b111: begin
                result = ALUa ^ ALUb;
            end
        endcase
         zero = (result == 0) ? 1 : 0;
    end
endmodule
