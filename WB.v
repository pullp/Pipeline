`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:16 12/11/2018 
// Design Name: 
// Module Name:    WB 
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
module WB(
		input clk,
		input[31:0] instr_in,
		input[31:0] imm_in,
		input[31:0] val_rs_in,
		input[31:0] val_rt_in,
		input[4:0] rwd_in,
		output[4:0] rwd_out,
		input[5:0] opcode_in,
		input[31:0] alu_res_in,
		input[31:0] mem_data_in,
		output[31:0] wb_data,
		input[31:0] pc_in
    );
	 assign rwd_out = rwd_in;
	 assign wb_data = (opcode_in == `LDW) ? mem_data_in : alu_res_in;

endmodule
