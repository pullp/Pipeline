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
	code_mem[0] <= 32'b01000100001010100000000000000000; //LW R1 R10 0
	code_mem[1] <= 32'b00000100011000100000100000000000; //ADD R3 R2 R1 0
	code_mem[2] <= 32'b00000100101000010010000000000000; //ADD R5 R1 R4 0
	code_mem[3] <= 32'b01000100001010100000000000000001; //LW R1 R10 1
	code_mem[4] <= 32'b00000100110000010000100000000000; //ADD R6 R1 R1 0
	code_mem[5] <= 32'b00000100111000010000100000000000; //ADD R7 R1 R1 0
	code_mem[6] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[7] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[8] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[9] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[10] <= 32'b00000000000000000000000000000000; //JUMP 0
	code_mem[11] <= 32'b11111111111111111111111111111111; //avoid some wariningend

	end
endmodule
