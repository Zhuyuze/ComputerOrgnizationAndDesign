`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/29 07:28:20
// Design Name: 
// Module Name: cpu
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


module cpu(
    input clock,
    input reset,
    output [7:0] out1,
    output [7:0] out2,
    output [7:0] out3,
    output [7:0] out4
    );
    wire [3:0] d1, d2, d3, d4;
    wire clk, res;
    wire [5:0] op;
    wire [4:0] s, t, d;
    wire [31:0] o1, o2, pc, rs;
    SingleCycleCPU scpu(  
         .clk(clk), 
         .Reset(res),  
         .opCode(op),  
         .Out1(o1), 
         .Out2(o2), 
         .curPC(pc), 
         .Result(rs),
         .rs(s), 
         .rt(t), 
         .rd(d) );
    clkdiv c(.clk(clock), .clk_sys(clk));
    decoderseg de1(.num(d1), .dispcode(out1));
    decoderseg de2(.num(d2), .dispcode(out2));
    decoderseg de3(.num(d3), .dispcode(out3));
    decoderseg de4(.num(d4), .dispcode(out4));

        assign d1 = s[3:0];
        assign d2 = t[3:0];
        assign d3 = d[3:0];
        assign d4 = op[3:0];

    
endmodule
