`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/28 06:29:38
// Design Name: 
// Module Name: DataMemory
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


module dataMemory(DAddr, DataIn, DataMemRW, DataOut);  
    input [31:0] DAddr, DataIn;  
     input DataMemRW;  
     output reg [31:0] DataOut;  
     reg [7:0] memory [0:127];       // read data  
     always @(DataMemRW) begin  
     if (DataMemRW) begin // 1 Îª Ð´
               memory[DAddr+3] = DataIn[31:24]; 
               memory[DAddr+2] = DataIn[23:16];
               memory[DAddr+1] = DataIn[15:8];
               memory[DAddr] = DataIn[7:0];
           end else begin // 0 Îª ¶Á
               DataOut[31:24] = memory[DAddr+3];
               DataOut[23:16] = memory[DAddr+2];
               DataOut[15:8] = memory[DAddr+1];
               DataOut[7:0] = memory[DAddr]; 
     end  
     end
       
  
endmodule  