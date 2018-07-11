`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/29 07:25:18
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(
input clk, //100MHz��ϵͳĬ����Ƶ��
output reg clk_sys = 0 //1Hz����Ƶ���Ƶ�ʡ������ʼ��Ϊ0
);
reg [25:0] div_counter = 0;
always @(posedge clk) begin
//if(div_counter>=50) begin // ���ڷ���
if(div_counter>=50000000) begin // �������ɱ������ļ�������
clk_sys <= ~clk_sys; // ��ƽ����
div_counter <= 0;
end else begin
div_counter <= div_counter + 1;
end
end
endmodule
