`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 16:44:30
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
	input CLK, 
	input RST, 
	input zero, 
	input [5:0] opCode, 
	output reg PCWre, 
	output reg ALUSrcA, 
	output reg ALUSrcB, 
	output reg DBDataSrc,
	output reg RegWre, 
	output reg WrRegDSrc, 
	output reg InsMemRW, 
	output reg RD, 
	output reg WR, 	
	output reg IRWre, 
	output reg [1:0] ExtSel, 
	output reg [1:0] PCSrc, 
	output reg [1:0] RegDst, 
	output reg [2:0] ALUOp,
	output reg [2:0] StatusOut
	);
    reg [2:0] Status;
	// 状�?�转换机
    always@(posedge CLK) begin
        if (RST == 0)
            Status = 3'b000;
        else begin
            case(Status)
                3'b000:
                    Status = 3'b001;
                3'b001: begin
					if (opCode[5:3] == 3'b111)
						Status = 3'b000;
					else begin
						if (opCode[5:2] == 4'b1100) 
							Status = 3'b010;// sw, lw
						else if (opCode[5:2] == 4'b1101)
							Status = 3'b101;// beq
						else
							Status = 3'b110;//add..sll
					end
				end
                3'b110:
                    Status = 3'b111;
                3'b101, 3'b111, 3'b100:
                    Status = 3'b000;
                3'b010:
                    Status = 3'b011;
                3'b011:
                    Status = (opCode == 6'b110000) ? 3'b000 : 3'b100;
            endcase
        end
    end
    // 信号产生�?
    always@(Status or zero or opCode) begin
        case(Status)
            3'b000:
                begin
					if (RST == 0)
						PCWre = 1;
					else begin
						if (opCode == 6'b111111)
							PCWre = 0;
						else
							PCWre = 1;
					end
                    InsMemRW = 0;
                    IRWre = 0;
                    RegWre = 0;
                    DBDataSrc = 0;
                end
            3'b001:
                begin
                    PCWre = 0;
                    IRWre = 1;
					RegWre = (opCode == 6'b111010) ? 1 : 0;
					if (opCode == 6'b110100 && zero == 1)
						PCSrc = 2'b01;
					else begin
						if (opCode == 6'b111001)
							PCSrc = 2'b10;
						else begin
							if (opCode == 6'b111000 || opCode == 6'b111010)
								PCSrc = 2'b11;
							else
								PCSrc = 2'b00;
						end
					end
                    WrRegDSrc = (opCode == 6'b111010) ? 0 : 1;
                    if (opCode == 6'b111010)
						RegDst = 2'b00;
					else begin
						// some bug
						if (opCode == 6'b000010 || opCode == 6'b010010 || opCode == 6'b110001 || opCode == 6'b100111)
							RegDst = 2'b01;
						else
							RegDst = 2'b10;
					end
                    if (opCode == 6'b011000)
						ExtSel = 2'b00;
					else begin
						if (opCode == 6'b010010)
							ExtSel = 2'b01;
						else
							ExtSel = 2'b10;
					end
					if (opCode == 6'b110000) begin
					     WR = 0;
					     RD = 1;
					end
					else if (opCode == 6'b110001) begin
					     WR = 1;
					     RD = 0;
					end
                    DBDataSrc = 0;
                end
            3'b110, 3'b101, 3'b010:
                begin
					if (opCode == 6'b110100 && zero == 1)
						PCSrc = 2'b01;
					else begin
						if (opCode == 6'b111001) 
							PCSrc = 2'b10;
						else begin
							if (opCode == 6'b111000 || opCode == 6'b111010)
								PCSrc = 2'b11;
							else
								PCSrc = 2'b00;
						end
					end
				// ALUOp
					if (opCode == 6'b000000 || opCode == 6'b000010)
						ALUOp = 3'b000;//add, addi
					else if (opCode == 6'b000001)
						ALUOp = 3'b001;//sub
					else if (opCode == 6'b010000 || opCode == 6'b010010)
						ALUOp = 3'b101;//or, ori
					else if (opCode == 6'b010001)
						ALUOp = 3'b110;//and
					else if (opCode == 6'b011000)
						ALUOp = 3'b100;//sll
					else if (opCode == 6'b100110 || opCode == 6'b100111)
						ALUOp = 3'b010;//slt, slti
					else if (opCode == 6'b110100)
						ALUOp = 3'b111;//beq
					else if (opCode == 6'b110000 || opCode == 6'b110001)
                        ALUOp = 3'b000;//sw, lw
					else
						ALUOp = 3'bxxx;//others
				// ALUSrcA
                    if (opCode == 6'b011000)
						ALUSrcA = 1;
					else
						ALUSrcA = 0;
					if (opCode == 6'b000010 || opCode == 6'b010010 || opCode[5:2] == 4'b1100)
						ALUSrcB = 1;
					else
						ALUSrcB = 0;
                end
            3'b011:
                begin
					if (opCode == 6'b110001) begin
						DBDataSrc = 1;
						RD = 0;
						WR = 1;
					end
					else if (opCode == 6'b110000) begin
						DBDataSrc = 0;
						RD = 1;
						WR = 0;
					end
                end
            3'b111, 3'b100:
                begin
                    RegWre = (opCode == 6'b110100 || opCode == 6'b110000 || opCode[5:3] == 3'b111) ? 0 : 1;
                end
        endcase
    end
endmodule