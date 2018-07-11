`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 09:23:13
// Design Name: 
// Module Name: PC
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


module PC(
	input CLK, 
	input RST, 
	input PCWre, 
	input [1:0] PCSrc,
	input [31:0] ExtOut,
	input [31:0] read_data1,
	input [31:0] JPCOut,
	output reg [31:0] PCOut
	);

    always@(posedge CLK) begin
        if (RST == 0) begin
            PCOut = 32'h00000000;
        end
        else begin
			#1
            if (PCWre == 1) begin
                case(PCSrc)
					2'b00:
						PCOut = PCOut + 4;
					2'b01:
						PCOut = PCOut + 4 + (ExtOut << 2);
					2'b10:
						PCOut = read_data1;
					2'b11:
						PCOut = JPCOut;
				endcase
            end
        end
    end
endmodule
