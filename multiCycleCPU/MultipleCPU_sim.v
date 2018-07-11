`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/01 09:48:08
// Design Name: 
// Module Name: MultipleCPU_sim
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
module MultipleCPU_sim;
	reg CLK;
	reg RST;
	wire [4:0] Rs, Rt, Rd;
	wire [31:0] do, do1, aluo;
	wire [5:0] opc;
	CPU cpu(
		.CLK(CLK),
		.RST(RST),
		.rs(Rs),
		.rt(Rt),
		.rd(Rd),
		.DataOut(do),
		.DataOut1(do1),
		.ALUOut(aluo),
		.opCode(opc)
	);
	always #10 CLK = ~CLK;
	initial begin
		CLK = 0;
		RST = 0;
		#100 RST <= 1;
		
	end
endmodule

