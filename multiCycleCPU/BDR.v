`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/22 11:04:28
// Design Name: 
// Module Name: BDR
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


module BDR(
	input CLK, 
	input [31:0] read_data2, 
	output reg [31:0] BDROut
	);

    always@(posedge CLK) begin
        BDROut <= read_data2;
    end
endmodule
