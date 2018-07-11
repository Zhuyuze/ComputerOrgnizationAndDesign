`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/28 06:36:06
// Design Name: 
// Module Name: registerFile
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


module registerFile(clk, RegWre, RegOut, rs, rt, rd, ALUM2Reg, dataFromALU, dataFromRW, Data1, Data2);  
    input clk, RegOut, RegWre, ALUM2Reg;  
     input [4:0] rs, rt, rd;  
     input [31:0] dataFromALU, dataFromRW;  
     output [31:0] Data1, Data2;  
       
     wire [4:0] writeReg;  
     wire [31:0] writeData;  
     assign writeReg = RegOut? rd : rt;  
     assign writeData = ALUM2Reg? dataFromRW : dataFromALU;  
       
     reg [31:0] register[0:31];  
     integer i;  
     initial begin  
         for (i = 0; i < 32; i = i+1) register[i] <= 0;  
     end  
       
     // output  
     assign Data1 = register[rs];  
     assign Data2 = register[rt];  
       
     // Write Reg  

     always@(negedge clk)
     begin
        // 如果寄存器不为0，并且RegWre为真，写入数据
        if (RegWre && writeReg != 0)  register[writeReg] = writeData;
     end

  
endmodule 
