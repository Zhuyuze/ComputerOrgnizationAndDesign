`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  
// 
// Create Date: 2018/06/22 11:05:33
// Design Name: 
// Module Name: ALUoutDR
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


module ALUoutDR(
	input CLK, 
	input [31:0] result, 
	output reg [31:0] ALUOut
	);
    
    always@(posedge CLK) begin
        ALUOut <= result;
    end
endmodule
