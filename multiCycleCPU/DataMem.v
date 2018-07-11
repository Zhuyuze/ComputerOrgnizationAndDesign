`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/22 11:14:41
// Design Name: 
// Module Name: DataMem
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


module DataMem(
	input CLK,
	input RD, 
	input WR, 
	input [31:0] DAddr, 
	input [31:0] DataIn,
	output [31:0] DataOut
	);
    reg [7:0] DataRAM[0:127];
	always@(negedge CLK) begin
		if (~WR) begin
			DataRAM[DAddr] = DataIn[31:24];
			DataRAM[DAddr+1] = DataIn[23:16];
			DataRAM[DAddr+2] = DataIn[15:8];
			DataRAM[DAddr+3] = DataIn[7:0];
		end
	end
    assign DataOut = {DataRAM[DAddr], DataRAM[DAddr+1],DataRAM[DAddr+2],DataRAM[DAddr+3]};
endmodule
