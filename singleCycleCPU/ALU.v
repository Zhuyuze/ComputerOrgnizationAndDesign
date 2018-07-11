`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/28 06:27:02
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


module ALU(ReadData1, ReadData2, inExt, ALUSrcB, ALUOp, zero, result, sa, alusrca);  
    input [4:0] sa;
    input [31:0] ReadData1, ReadData2, inExt;  
    input alusrca;
     input ALUSrcB;  
     input [2:0] ALUOp;  
     output zero;  
     output [31:0] result;  
       
     reg zero;  
     reg [31:0] result;  
     wire [31:0] A;
     wire [31:0] B;  
     assign A[4:0] = alusrca? sa: ReadData1[4:0];
     assign A[31:5] = alusrca? 27'b000000000000000000000000000: ReadData1[31:5];
     assign B = ALUSrcB? inExt : ReadData2;  
       
     always @(ReadData1 or ReadData2 or inExt or ALUSrcB or ALUOp or B)  
         begin  
              case(ALUOp)  
                    // A + B  
                     3'b000: begin  
                         result = A + B;  
                          zero = (result == 0)? 1 : 0;  
                     end  
                     // A - B  
                     3'b001: begin  
                         result = A - B;  
                          zero = (result == 0)? 1 : 0;  
                     end  
                     // B << A  
                     3'b010: begin  
                         result = B << A;  
                          zero = (result == 0)? 1 : 0;  
                     end  
                     // A ¡Å B  
                     3'b011: begin  
                         result = A | B;  
                          zero = (result == 0)? 1 : 0;  
                     end  
                     // A ¡Ä B  
                     3'b100: begin  
                         result = A & B;  
                          zero = (result == 0)? 1 : 0;  
                     end  
                     // A < B  
                     3'b101: begin  
                         result = (~A < B);  
                          zero = (result == 0)? 1 : 0;  
                     end  
                     // A sign< B  
                     3'b110: begin  
                         result = ((A[31] == 1 && B[31] == 0) || (A < B && A[31] == B[31]));  
                          zero = (result == 0)? 1 : 0;  
                     end  
                     // A ? B  
                     3'b111: begin  
                         result = A ^ B;  
                          zero = (result == 0)? 1 : 0;  
                     end  
              endcase  
          end  
endmodule
