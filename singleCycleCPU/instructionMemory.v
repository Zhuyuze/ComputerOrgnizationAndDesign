`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/28 06:35:23
// Design Name: 
// Module Name: instructionMemory
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


module instructionMemory(  
    input [31:0] pc,  
    input InsMemRW,  
     output [5:0] op,   
     output [4:0] rs, rt, rd,  
     output [15:0] immediate,
     output [25:0] jaddr,
     output[4:0] sa
     );  
       
     wire [7:0] mem[0:68];  
       
     assign mem[0] = 8'h04;
             assign mem[1] = 8'h01;
             assign mem[2] = 8'h00;
             assign mem[3] = 8'h08;
             // addi  $1,$0,8 
             assign mem[4] = 8'h40;
             assign mem[5] = 8'h02;
             assign mem[6] = 8'h00;
             assign mem[7] = 8'h02; 
              // ori  $2,$0,2 
            assign  mem[8] = 8'h00;
            assign  mem[9] = 8'h41;
            assign  mem[10] = 8'h18;
            assign  mem[11] = 8'h00; 
              // add  $3,$2,$1  
              assign mem[12] = 8'h08;
              assign mem[13] = 8'h62;
             assign  mem[14] = 8'h28;
             assign  mem[15] = 8'h00;
              // sub  $5,$3,$2  
             assign  mem[16] = 8'h44;
           assign    mem[17] = 8'hA2;
            assign   mem[18] = 8'h20;
             assign  mem[19] = 8'h00; 
              // and  $4,$5,$2  
             assign  mem[20] = 8'h48;
             assign  mem[21] = 8'h82;
             assign  mem[22] = 8'h40;
             assign  mem[23] = 8'h00; 
              // or  $8,$4,$2  
             assign  mem[24] = 8'h61;
            assign   mem[25] = 8'h08;
             assign  mem[26] = 8'h08;
             assign  mem[27] = 8'h00; 
              // sll  $8,$8,1 
             assign  mem[28] = 8'hC5;
             assign  mem[29] = 8'h01;
             assign  mem[30] = 8'hFF;
             assign  mem[31] = 8'hFE; 
              // bne  $8,$1,-2  
             assign  mem[32] = 8'h6C;
             assign  mem[33] = 8'h46;
             assign  mem[34] = 8'h00;
            assign   mem[35] = 8'h08; 
              // slti  $6,$2,8  
             assign  mem[36] = 8'h6C;
             assign  mem[37] = 8'hC7;
             assign  mem[38] = 8'h00;
             assign  mem[39] = 8'h00; 
              // slti  $7,$6,0  
             assign  mem[40] = 8'h04;
             assign  mem[41] = 8'hE7;
             assign  mem[42] = 8'h00;
             assign  mem[43] = 8'h08; 
              // addi $7,$7,8  
             assign  mem[44] = 8'hC0;
             assign  mem[45] = 8'hE1;
            assign   mem[46] = 8'hFF;
            assign   mem[47] = 8'hFE; 
              // beq $7, $1, -2  
             assign  mem[48] = 8'h98;
            assign   mem[49] = 8'h22;
             assign  mem[50] = 8'h00;
             assign  mem[51] = 8'h04; 
                //sw $2, 4($1)
               assign  mem[52] = 8'h9C;
              assign   mem[53] = 8'h29;
              assign   mem[54] = 8'h00;
              assign   mem[55] = 8'h04; 
             //lw  $9, 4($1)
            assign  mem[56] = 8'hE0;
            assign  mem[57] = 8'h00;
           assign   mem[58] = 8'h00;
            assign  mem[59] = 8'h10; 
             // j 0x00000040
            assign  mem[60] = 8'h04;
            assign  mem[61] = 8'h0A;
            assign  mem[62] = 8'h00;
            assign  mem[63] = 8'h0A; 
             //addi $10, $0, 10
            assign  mem[64] = 8'hFC;
            assign  mem[65] = 8'h00;
            assign  mem[66] = 8'h00;
            assign  mem[67] = 8'h00; 
       
     // output  
     assign op = mem[pc[7:0]][7:2];  
     assign rs[4:3] = mem[pc[7:0]][1:0];  
     assign rs[2:0] = mem[pc[7:0]+1][7:5];
     assign rt = mem[pc[7:0]+1][4:0];  
     assign rd = mem[pc[7:0]+2][7:3];  
     assign immediate[15:8] = mem[pc[7:0]+2][7:0];  
     assign immediate[7:0] = mem[pc[7:0]+3][7:0];
     assign jaddr[25:24] = mem[pc[7:0]][1:0];
     assign jaddr[23:16] = mem[pc[7:0]+1][7:0];
     assign jaddr[15:8] = mem[pc[7:0]+2][7:0];
     assign jaddr[7:0] = mem[pc[7:0]+3][7:0];
     assign sa[4:2] = mem[pc[7:0]+2][2:0];
     assign sa[1:0] = mem[pc[7:0]+3][7:6];
  
endmodule 
