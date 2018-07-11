`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 16:13:23
// Design Name: 
// Module Name: Extend
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


module Extend(
	input [15:0] immediate_16, 
	input [1:0] ExtSel,
	input [25:0] JPCIn,
	input [31:0] PCOut,
	input [4:0] sa,
	output reg [31:0] JPCOut,
	output reg [31:0] immediate_32
	);

    always@(ExtSel or JPCIn or immediate_16 or sa) begin
        if (ExtSel == 2'b00) begin
			immediate_32[31:5] = 27'h0000000;
			immediate_32[4:0] = sa;
		end
		else if (ExtSel == 2'b01) begin
			immediate_32[31:16] = 16'h0000;
			immediate_32[15:0] = immediate_16;
		end
		else if (ExtSel == 2'b10) begin
			immediate_32[15:0] = immediate_16;
			if (immediate_16[15] == 0)
				immediate_32[31:16] = 16'h0000;
			else
				immediate_32[31:16] = 16'hffff;
		end
		JPCOut = {PCOut[31:28], JPCIn[25:0], 2'b00};
    end
endmodule
