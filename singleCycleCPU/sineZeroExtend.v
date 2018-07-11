`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/28 06:28:47
// Design Name: 
// Module Name: sineZeroExtend
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


module signZeroExtend(immediate, ExtSel, out);  
    input [15:0] immediate;  
     input ExtSel;  
     output [31:0] out;  
       
     assign out[15:0] = immediate;  
     assign out[31:16] = ExtSel? (immediate[15]? 16'hffff : 16'h0000) : 16'h0000;  
  
endmodule
