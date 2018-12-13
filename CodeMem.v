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
	code_mem[0] <= 32'b00000100001000100001100000000000; //ADD R1 R2 R3 0
	code_mem[1] <= 32'b00000100101001000000100000000000; //ADD R5 R4 R1 0
	code_mem[2] <= 32'b00000100111001100000100000000000; //ADD R7 R6 R1 0
	code_mem[3] <= 32'b00000100001000100001100000000000; //ADD R1 R2 R3 0
	code_mem[4] <= 32'b00000101000000010000100000000000; //ADD R8 R1 R1 0
	code_mem[5] <= 32'b00000101001000010000100000000000; //ADD R9 R1 R1 0
	code_mem[6] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[7] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[8] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[9] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[10] <= 32'b00000000000000000000000000000000; //JUMP 0
	end
endmodule
