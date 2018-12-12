`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:02 12/11/2018 
// Design Name: 
// Module Name:    MEM 
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
module MEM(
		input clk,
		input[31:0] val_rt_in,
		input[4:0] rwd_in,
		output reg [4:0] rwd_out,
		input[5:0] opcode_in,
		output reg [5:0] opcode_out,
		input[31:0] alu_res_in,
		output reg [31:0] alu_res_out,
		output reg [31:0] mem_data_out
    );

//module WB(
//		input[4:0] rwd_in,
//		output[4:0] rwd_out,
//		input[5:0] opcode_in,
//		input[31:0] alu_res_in,
//		input[31:0] mem_data_in,
//		output[31:0] wb_data
//    );
		wire [31:0] data_out_l;
		
//module DataMem(
//    input CLK,
//    input [31:0] addr, //alu_out
//    input [31:0] data, //val_rt
//    input [5:0] opcode,
//    output [31:0] out
//    );
		DataMem data_mem(.CLK(clk), .addr(alu_res_in), .data(val_rt_in), .opcode(opcode_in), .out(data_out_l));
		
		always@(posedge clk)
			begin
			rwd_out <= rwd_in;
			opcode_out <= opcode_in;
			alu_res_out <= alu_res_in;
			mem_data_out <= data_out_l;
			end
			
		initial
			begin
			rwd_out=0;
			opcode_out=0;
			alu_res_out=0;
			mem_data_out=0;
			end
endmodule
