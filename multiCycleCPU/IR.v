`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 15:20:41
// Design Name: 
// Module Name: IR
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


module IR(
	input CLK, 
	input IRWre,
	input [31:0] DataOut, 
	output reg [5:0] opCode,
	output reg [4:0] rs,
	output reg [4:0] rt,
	output reg [4:0] rd,
	output reg [4:0] sa,
	output reg [15:0] immediate_16,
	output reg [25:0] JPCIn
	);

    always@(posedge CLK) begin
		#1
		if (IRWre == 1) begin
			opCode = DataOut[31:26];
		// rs
			if (opCode == 6'b111111 || opCode == 6'b111000 || opCode == 6'b111010 || opCode == 6'b011000)//halt, j, jal, sll
				rs = 5'bxxxxx;
			else
				rs = DataOut[25:21];
		// rt
			if (opCode[5:3] == 3'b111)// || opCode == 6'b011000
				rt = 5'bxxxxx;
			else begin
				if (opCode == 6'b011000)
					rt = DataOut[25:21];//sll
				else
					rt = DataOut[20:16];
			end
		// rd
			if (opCode == 6'b000000 || opCode == 6'b000001 || opCode == 6'b010000 || opCode == 6'b010001 || opCode == 6'b100110)
				rd = DataOut[15:11];//add, sub, or, and, slt,
			else if (opCode == 6'b011000)
				rd = DataOut[20:16];//sll
			else
				rd = 5'bxxxxx;
		// sa
			if (opCode == 6'b011000)
				sa = DataOut[15:11];//sll
			else
				sa = 5'bxxxxx;
		// immediate_16
			if (opCode == 6'b000010 || opCode == 6'b010010 || opCode == 6'b100111 || opCode[5:3] == 3'b110)
				immediate_16 = DataOut[15:0];//addi, ori, slti, sw, lw, beq
			else
				immediate_16 = 16'hxxxx;
		// JPCIn
			if (opCode == 6'b111000 || opCode == 6'b111010)
				JPCIn = DataOut[25:0];
			else
				JPCIn = 26'hxxxxxxx;
		end
    end
endmodule
