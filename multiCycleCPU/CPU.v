`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/27 08:55:24
// Design Name: 
// Module Name: CPU
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
`include "PC.v"
`include "InsMem.v"
`include "IR.v"
`include "Registers.v"
`include "Extend.v"
`include "ControlUnit.v"
`include "ADR.v"
`include "BDR.v"
`include "ALU.v"
`include "ALUoutDR.v"
`include "DataMem.v"
`include "DBDR.v"

module CPU(input CLK, RST, output wire [4:0] rs, rt, rd, output wire [31:0] DataOut, DataOut1, ALUOut, output wire [5:0] opCode);
	
	
	
	wire PCWre, InsMemRW, IRWre, WrRegDSrc, RegWre, ALUSrcA, ALUSrcB, DBDataSrc, RD, WR;
	wire [1:0] PCSrc, RegDst, ExtSel;
	wire [2:0] ALUOp;
	wire [31:0] PCOut;
	wire [4:0] sa;
	wire [15:0] immediate_16;
	wire [25:0] JPCIn;
	wire zero;
	wire [31:0] read_data1, read_data2, immediate_32, JPCOut, ADROut, BDROut, result, DB; 
	//module PC(input CLK,input RST, input PCWre, input [1:0] PCSrc, input [31:0] ExtOut, input [31:0] read_data1, input [31:0] JPCOut, output reg [31:0] PCOut        );
	PC pc(CLK, RST, PCWre, PCSrc, immediate_32, read_data1, JPCOut, PCOut);
	InsMem insmem(PCOut, InsMemRW, DataOut);
	IR ir(CLK, IRWre, DataOut, opCode, rs, rt, rd, sa, immediate_16, JPCIn);
	Registers registers(CLK, RegWre, rs, rt, rd, RegDst, WrRegDSrc, PCOut, DB, read_data1, read_data2);
	Extend extend(immediate_16, ExtSel, JPCIn, PCOut, sa, JPCOut, immediate_32);
	ControlUnit controlunit(CLK, RST, zero, opCode, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, WrRegDSrc, InsMemRW, RD, WR, IRWre, ExtSel, PCSrc, RegDst, ALUOp, StatusOut);
	ADR adr(CLK, read_data1, ADROut);
	BDR bdr(CLK, read_data2, BDROut);
	ALU alu(ALUSrcA, ALUSrcB, ALUOp, ADROut, sa, BDROut, immediate_32, zero, result);
	ALUoutDR aluoutdr(CLK, result, ALUOut);
	DataMem datamem(CLK, RD, WR, ALUOut, BDROut, DataOut1);
	DBDR dbdr(CLK, DBDataSrc, result, DataOut1, DB);
endmodule
