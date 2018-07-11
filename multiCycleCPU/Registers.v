`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 15:38:26
// Design Name: 
// Module Name: Registers
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


module Registers(
	input CLK, 
	input RegWre, 
	input [4:0] rs, 
	input [4:0] rt, 
	input [4:0] rd, 
	input [1:0] RegDst, 
	input WrRegDSrc, 
	input [31:0] PCOut, 
	input [31:0] DB, 
	output [31:0] read_data1, 
	output [31:0] read_data2
	);
    reg [4:0] rin;
    reg [31:0] registers [31:0];
	integer i;
	initial begin
		for (i = 0; i < 11; i = i + 1)
			registers[i] = i+2;
		registers[16] = 8;
	end
	assign read_data1 = registers[rs];
    assign read_data2 = registers[rt];
    
	always@(negedge CLK) begin
        if (RegWre == 1) begin
			if (WrRegDSrc == 1)
				registers[rin] = DB;
			else
				registers[rin] = PCOut + 4;
		end
    end
	
	always@(RegDst or rt or rd) begin
		if (RegDst == 2'b00)
			rin = 5'h1f;
		else begin
			if (RegDst == 2'b01)
				rin = rt;
			else
				rin = rd;
		end
    end
    
    
endmodule
