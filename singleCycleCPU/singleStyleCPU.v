`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/28 06:37:04
// Design Name: 
// Module Name: singleStyleCPU
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


`include "controlUnit.v"  
`include "dataMemory.v"  
`include "ALU.v"  
`include "instructionMemory.v"  
`include "registerFile.v"  
`include "sineZeroExtend.v"  
`include "PC.v"  
`timescale 1ns / 1ps  
  
module SingleCycleCPU(  
    input clk, Reset,  
     output wire [5:0] opCode,  
     output wire [31:0] Out1, Out2, curPC, Result,
    output wire[4:0] rs, rt, rd );  
       
     wire[1:0] PCSrc;
     wire [25:0] jaddr;
     wire [2:0] ALUOp;  
     wire [31:0] ExtOut, DMOut;  
     wire [15:0] immediate;  
     wire [4:0] sa;  
     wire zero, PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, RegOut, alusrca;  
       
     // module ALU(ReadData1, ReadData2, inExt, ALUSrcB, ALUOp, zero, result);  
     ALU alu(Out1, Out2, ExtOut, ALUSrcB, ALUOp, zero, Result, sa, alusrca);  
     // module PC(clk, Reset, PCWre, PCSrc, immediate, Address);  
     PC pc(clk, Reset, PCWre, PCSrc, ExtOut, curPC, jaddr);  
     // module controlUnit(opCode, zero, PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp);  
     controlUnit control(opCode, zero, PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp, alusrca);  
     // module dataMemory(DAddr, DataIn, DataMemRW, DataOut);  
     dataMemory datamemory(Result, Out2, DataMemRW, DMOut);  
     /* module instructionMemory(  
    input [31:0] pc,  
    input InsMemRW,  
     input [5:0] op,   
     input [4:0] rs, rt, rd,  
     output [15:0] immediate);*/  
     instructionMemory ins(curPC, InsMemRW, opCode, rs, rt, rd, immediate, jaddr, sa);  
     // module registerFile(clk, RegWre, RegOut, rs, rt, rd, ALUM2Reg, dataFromALU, dataFromRW, Data1, Data2);  
     registerFile registerfile(clk, RegWre, RegOut, rs, rt, rd, ALUM2Reg, Result, DMOut, Out1, Out2);  
    // module signZeroExtend(immediate, ExtSel, out);  
     signZeroExtend ext(immediate, ExtSel, ExtOut);  
  
  
endmodule
