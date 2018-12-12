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
		code_mem[0] = 32'b01000100001000000000000000000001;
		code_mem[1] = 32'b01000100010000000000000000000010;
		code_mem[2] = 32'b01000100011000000000000000000011;
		code_mem[3] = 32'b01000100100000000000000000000100;
		code_mem[4] = 32'b01000100101000000000000000000101;
		code_mem[5] = 32'b00000100100000010001000000000000;
		code_mem[6] = 32'b00000100101000010001100000000000;
		code_mem[7] = 32'b01000100001000000000000000001010;
		code_mem[8] = 32'b01000100010000010000000000000001;
		code_mem[9] = 32'b01000100011000010000000000000010;
		code_mem[10] = 32'b00000100101000110010000000000000;
		code_mem[11] = 32'b00000100110000110001000000000000;
		code_mem[12] = 32'b00001001001001100011100000000000;
		code_mem[13] = 32'b00001001010001100100000000000000;
		code_mem[14] = 32'b01000101011010100000000000000000;
		code_mem[15] = 32'b01000101100010100000000000000010;
		code_mem[16] = 32'b00000000000000000000000000000000;
		code_mem[17] = 32'b00000000000000000000000000000000;
		code_mem[18] = 32'b00000000000000000000000000000000;
		code_mem[19] = 32'b00000000000000000000000000000000;
		code_mem[20] = 32'b00000000000000000000000000000000;
		code_mem[21] = 32'b00000000000000000000000000000000;
		code_mem[22] = 32'b00000000000000000000000000000000;
		code_mem[23] = 32'b00000000000000000000000000000000;
		code_mem[24] = 32'b00000000000000000000000000000000;
		end
endmodule
