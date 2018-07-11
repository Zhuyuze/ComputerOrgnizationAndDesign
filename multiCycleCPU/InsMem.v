`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 09:57:18
// Design Name: 
// Module Name: InsMem
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


module InsMem(
	input [31:0] IAddr, 
	input InsMemRW, 
	output [31:0] DataOut
	);
    reg [7:0] mem [127:0];
	// initial begin处利用赋值初始化指令
	initial begin
        mem[0] = 8'h08;
        mem[1] = 8'h01;
        mem[2] = 8'h00;
        mem[3] = 8'h08;
                 // addi  $1,$0,8 
        mem[4] = 8'h48;
        mem[5] = 8'h02;
        mem[6] = 8'h00;
        mem[7] = 8'h02; 
                  // ori  $2,$0,2 
          mem[8] = 8'h40;
          mem[9] = 8'h41;
          mem[10] = 8'h18;
          mem[11] = 8'h00; 
                  // add  $3,$2,$1  
          mem[12] = 8'h04;
          mem[13] = 8'h61;
          mem[14] = 8'h20;
          mem[15] = 8'h00;
                  // sub  $5,$3,$2  
          mem[16] = 8'h44;
          mem[17] = 8'h82;
          mem[18] = 8'h28;
          mem[19] = 8'h00; 
                  // and  $4,$5,$2  
          mem[20] = 8'h60;
          mem[21] = 8'h05;
          mem[22] = 8'h28;
          mem[23] = 8'h80; 
                  // or  $8,$4,$2  
          mem[24] = 8'hD0;
          mem[25] = 8'hA1;
          mem[26] = 8'hFF;
          mem[27] = 8'hFE; 
                  // sll  $8,$8,1 
          mem[28] = 8'hE8;
          mem[29] = 8'h00;
          mem[30] = 8'h00;
          mem[31] = 8'h10; 
                  // bne  $8,$1,-2  
          mem[32] = 8'h99;
          mem[33] = 8'h81;
          mem[34] = 8'h80;
          mem[35] = 8'h00; 
                  // slti  $6,$2,8  
          mem[36] = 8'h08;
          mem[37] = 8'h0D;
          mem[38] = 8'hFF;
          mem[39] = 8'hFE; 
                  // slti  $7,$6,0  
          mem[40] = 8'h99;
          mem[41] = 8'h0D;
          mem[42] = 8'h88;
          mem[43] = 8'h00; 
                  // addi $7,$7,8  
          mem[44] = 8'h9D;
          mem[45] = 8'h2A;
          mem[46] = 8'h00;
          mem[47] = 8'h02; 
                  // beq $7, $1, -2  
          mem[48] = 8'h9D;
          mem[49] = 8'h4B;
          mem[50] = 8'h00;
          mem[51] = 8'h00; 
                    //sw $2, 4($1)
          mem[52] = 8'h09;
          mem[53] = 8'hAD;
          mem[54] = 8'h00;
          mem[55] = 8'h01; 
                 //lw  $9, 4($1)
          mem[56] = 8'hD9;
          mem[57] = 8'hA0;
          mem[58] = 8'hFF;
          mem[59] = 8'hFE; 
                 // j 0x00000040
          mem[60] = 8'hE0;
          mem[61] = 8'h00;
          mem[62] = 8'h00;
          mem[63] = 8'h13; 
                 //addi $10, $0, 10
          mem[64] = 8'hC0;
          mem[65] = 8'h22;
          mem[66] = 8'h00;
          mem[67] = 8'h04; 
                
          mem[68] = 8'hC4;
          mem[69] = 8'h2C;
          mem[70] = 8'h00;
          mem[71] = 8'h04; 
                            
          mem[72] = 8'hE7;
          mem[73] = 8'hE0;
          mem[74] = 8'h00;
          mem[75] = 8'h00; 
                                        
          mem[76] = 8'hFC;
          mem[77] = 8'h00;
          mem[78] = 8'h00;
          mem[79] = 8'h00;
         end
    assign DataOut = {mem[IAddr-32'h00000000], mem[IAddr-32'h00000000+1], mem[IAddr-32'h00000000+2], mem[IAddr-32'h00000000+3]};
endmodule
