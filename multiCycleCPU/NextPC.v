`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 16:19:42
// Design Name: 
// Module Name: NextPC
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


module NextPC(PCSrc, PCOut, immediate_32, read_data1, addr25, NewPC);
	input [1:0] PCSrc;
	input [31:0] PCOut;
	input [31:0] immediate_32;
	input [31:0] read_data1;
	input [25:0] addr25;
	output reg [31:0] NewPC;
	always@(*) begin
	   case(PCSrc)
            2'b00:
                NewPC = PCOut << 2;
            2'b01:
                NewPC = PCOut << 2 + (immediate_32 << 2);
            2'b10:
                NewPC = read_data1;
            2'b11:
                NewPC = { PCOut[29:26], addr25 << 2, 2'b00};
        endcase
	end
endmodule
