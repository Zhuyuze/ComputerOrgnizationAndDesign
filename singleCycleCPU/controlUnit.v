`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/28 06:26:12
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(opCode, zero, PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp, alusrca);  
    input [5:0] opCode;  
     input zero;  
     output PCWre,ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, RegOut, alusrca;  
     output[2:0] ALUOp;  
     output[1:0] PCSrc;
      
     assign alusrca = (opCode == 6'b011000)?1:0;
     assign PCWre = (opCode == 6'b111111)? 0 : 1;  
     assign ALUSrcB = (opCode == 6'b000001 || opCode == 6'b010000 || opCode == 6'b011011 || opCode == 6'b100110 || opCode == 6'b100111)? 1 : 0;  
     assign ALUM2Reg = (opCode == 6'b100111)? 1 : 0; // 
     assign RegWre = (opCode == 6'b110000 || opCode == 6'b110001 || opCode == 6'b100110 || opCode == 6'b111111 || opCode == 6'b111000)? 0 : 1;  
     assign InsMemRW = 0;  
     assign DataMemRW = (opCode == 6'b100111)? 0 : 1;  
     assign ExtSel = (opCode == 6'b010000)? 0 : 1;  
     assign PCSrc[1] = (opCode == 6'b111000)? 1:0;
     assign PCSrc[0] = ((opCode == 6'b110000 && zero == 1) || (opCode == 6'b110001 && zero == 0))? 1:0; 
     assign RegOut = (opCode == 6'b011011 || opCode == 6'b000001 || opCode == 6'b010000 || opCode == 6'b100111)? 0 : 1;  
     assign ALUOp[2] = (opCode == 6'b010001 || opCode == 6'b011011)? 1 : 0;  
     assign ALUOp[1] = (opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b011000 || opCode == 6'b011011)? 1 : 0;  
     assign ALUOp[0] = (opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b110000 || opCode == 6'b110001)? 1 : 0;   
       
endmodule
