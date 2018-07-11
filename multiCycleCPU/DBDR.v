`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 09:10:04
// Design Name: 
// Module Name: DBDR
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


module DBDR(
	input CLK, 
	input DBDataSrc, 
	input [31:0] result, 
	input [31:0] DataOut, 
	output reg [31:0] DB
	);
    
    always@(posedge CLK) begin
        if (DBDataSrc == 0)
            DB <= result;
        else if (DBDataSrc == 1)
            DB <= DataOut;
    end
endmodule
