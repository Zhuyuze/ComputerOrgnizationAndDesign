`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/28 06:27:55
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


module PC(clk, Reset, PCWre, PCSrc, immediate, Address, jaddr);  
    input clk, Reset, PCWre;  
    input [1:0] PCSrc;
     input [31:0] immediate; 
     input [25:0] jaddr; 
     output [31:0] Address;  
     reg [31:0] Address;  
       
     /*initial begin  
         Address = 0;  
     end*/  
       
     always @(posedge clk or negedge Reset)  
         begin  
              if (Reset == 0) begin  
                    Address = 0;  
                end  
                else if (PCWre) begin  
                    case(PCSrc)
                                2'b00: begin
                                    Address = Address + 4;
                                end
                                2'b01: begin
                                    Address = Address + 4 + immediate*4;
                                end
                                2'b10: begin
                                    Address[27:2] = jaddr;
                                    Address[31:27] = 6'b000000;
                                    Address[1:0] = 2'b00;
                                end
                       endcase  
                end  
          end  
  
endmodule