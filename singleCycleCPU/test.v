`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/28 06:48:04
// Design Name: 
// Module Name: test
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


module test;

    // Inputs
    reg CLK;
    reg Reset;
    // Outputs
    
    wire [5:0] opc;
    wire [31:0] o1;
    wire [31:0] o2;
    wire [31:0] curpc;
    wire [31:0] res;
    wire [4:0] Rs, Rt, Rd;

    // Instantiate the Unit Under Test (UUT)
    SingleCycleCPU uut (
        .clk(CLK), 
        .Reset(Reset), 
        .opCode(opc),
        .Out1(o1),
        .Out2(o2),
        .curPC(curpc),
        .Result(res),
        .rs(Rs),
        .rd(Rd),
        .rt(Rt)
    );

    always #5 CLK = ~CLK; // 周期为10ns
        initial begin
        CLK = 0;
        Reset = 0;
        #100 Reset = 1; // 从100ns 开始仿真输出
    end
endmodule
