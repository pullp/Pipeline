`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:21 11/21/2018 
// Design Name: 
// Module Name:    CodeMem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CodeMem(
    input [31:0] pc,
    output [31:0] instr
    );
	reg[31:0] code_mem[0:255];
	
	reg[31:0] instr_reg;
	assign instr = instr_reg;
	
	always@(*)
		begin
			instr_reg = code_mem[pc];
		end
			
initial
	begin
code_mem[0] <= 32'b01000101010010110000000000000001; //LW  R10 R11 1
code_mem[1] <= 32'b01000101100011010000000000000001; //LW  R12 R13 1
code_mem[2] <= 32'b00000101110011000110000000000000; //ADD  R14 R12 R12 0
code_mem[3] <= 32'b01000101010010110000000000000010; //LW  R10 R11 2
code_mem[4] <= 32'b01000101100011010000000000000010; //LW  R12 R13 2
code_mem[5] <= 32'b00000101110011000101000000000000; //ADD  R14 R12 R10 0
code_mem[6] <= 32'b01000101010010110000000000000011; //LW  R10 R11 3
code_mem[7] <= 32'b01000101100011010000000000000011; //LW  R12 R13 3
code_mem[8] <= 32'b00000101110010100110000000000000; //ADD  R14 R10 R12 0
code_mem[9] <= 32'b01000101010010110000000000000100; //LW  R10 R11 4
code_mem[10] <= 32'b01000101100011010000000000000100; //LW  R12 R13 4
code_mem[11] <= 32'b00000101110010100101000000000000; //ADD  R14 R10 R10 0
code_mem[12] <= 32'b00000101111100001000100000000000; //ADD  R15 R16 R17 0
code_mem[13] <= 32'b00000110010100111010000000000000; //ADD  R18 R19 R20 0
code_mem[14] <= 32'b00000101111100101001000000000000; //ADD  R15 R18 R18 0
code_mem[15] <= 32'b00000101111100001000100000000000; //ADD  R15 R16 R17 0
code_mem[16] <= 32'b00000110010100111010000000000000; //ADD  R18 R19 R20 0
code_mem[17] <= 32'b00000101111100100111100000000000; //ADD  R15 R18 R15 0
code_mem[18] <= 32'b00000101111100001000100000000000; //ADD  R15 R16 R17 0
code_mem[19] <= 32'b00000110010100111010000000000000; //ADD  R18 R19 R20 0
code_mem[20] <= 32'b00000110010011111001000000000000; //ADD  R18 R15 R18 0
code_mem[21] <= 32'b00000101111100001000100000000000; //ADD  R15 R16 R17 0
code_mem[22] <= 32'b00000110010100111010000000000000; //ADD  R18 R19 R20 0
code_mem[23] <= 32'b00000110010011110111100000000000; //ADD  R18 R15 R15 0
code_mem[24] <= 32'b00000000000000000000000000000000; //JUMP 0
code_mem[25] <= 32'b00000000000000000000000000000000; //JUMP 0
code_mem[26] <= 32'b00000000000000000000000000000000; //JUMP 0
code_mem[27] <= 32'b00000000000000000000000000000000; //JUMP 0
code_mem[28] <= 32'b00000000000000000000000000000000; //JUMP 0
code_mem[29] <= 32'b11111111111111111111111111111111; //avoid some warining
	end
endmodule
