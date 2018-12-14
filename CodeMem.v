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
	code_mem[0] <= 32'b00000100010000010000000000000000; //ADD R2 R1 R0 0 R2=1
	code_mem[1] <= 32'b00000100011000100000100000000000; //ADD R3 R2 R1 0 R3=2
	code_mem[2] <= 32'b00000100100000110001000000000000; //ADD R4 R3 R2 0 R4=3
	code_mem[3] <= 32'b00000100111001100010000000000000; //ADD R7 R6 R4 0 R7=9
	code_mem[4] <= 32'b00000101000001110011100000000000; //ADD R8 R7 R7 0 R8=18
	code_mem[5] <= 32'b01000101001010000000000000000000; //LW R9 R8 0 R9=18/STALL
	code_mem[6] <= 32'b00000100011000100100100000000000; //ADD R3 R2 R9 0 R3=19
	code_mem[7] <= 32'b00000100101010010010000000000000; //ADD R5 R9 R4 0 R5=21
	code_mem[8] <= 32'b01000101011010100000000000000010; //LW R11 R10 2 R11=12/STALL
	code_mem[9] <= 32'b00000101100010110101100000000000; //ADD R12 R11 R11 0 R12=24
	code_mem[10] <= 32'b00000101101010110101100000000000; //ADD R13 R11 R11 0 R13=24
	code_mem[11] <= 32'b00000101111011100111000000000000; //ADD R15 R14 R14 0 R15=28
	code_mem[12] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[13] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[14] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[15] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[16] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[17] <= 32'b11111111111111111111111111111111; //avoid some warining
	end
endmodule
