`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:41 11/21/2018 
// Design Name: 
// Module Name:    DataMem 
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
module DataMem(
    input CLK,
    input [31:0] addr,
    input [31:0] data,
    input [5:0] opcode,
    output [31:0] out
    );
	 reg [31:0] data_mem[255:0];
	 
	 reg [31:0] read_data=0;
	 assign out = read_data;
	 integer i;
	 
	 always@(*)
	  begin
			read_data <= data_mem[addr];
		end
		
	 always@(negedge CLK)
	  begin
	   if(opcode == `SDW)
			begin
			data_mem[addr] <= data;
			end
	  end

	  initial
			begin
data_mem[0] <= 32'd6;
data_mem[1] <= 32'd7;
data_mem[2] <= 32'd8;
data_mem[3] <= 32'd9;
data_mem[4] <= 32'd10;
data_mem[5] <= 32'd11;
data_mem[6] <= 32'd12;
data_mem[7] <= 32'd13;
data_mem[8] <= 32'd14;
data_mem[9] <= 32'd15;
data_mem[10] <= 32'd16;
data_mem[11] <= 32'd17;
data_mem[12] <= 32'd18;
data_mem[13] <= 32'd19;
data_mem[14] <= 32'd20;
data_mem[15] <= 32'd21;
data_mem[16] <= 32'd22;
data_mem[17] <= 32'd23;
data_mem[18] <= 32'd24;
data_mem[19] <= 32'd25;
data_mem[20] <= 32'd26;
data_mem[21] <= 32'd27;
data_mem[22] <= 32'd28;
data_mem[23] <= 32'd29;
data_mem[24] <= 32'd30;
data_mem[25] <= 32'd31;
data_mem[26] <= 32'd32;
data_mem[27] <= 32'd33;
data_mem[28] <= 32'd34;
data_mem[29] <= 32'd35;
data_mem[30] <= 32'd36;
data_mem[31] <= 32'd37;
data_mem[32] <= 32'd38;
data_mem[33] <= 32'd39;
data_mem[34] <= 32'd40;
data_mem[35] <= 32'd41;
data_mem[36] <= 32'd42;
data_mem[37] <= 32'd43;
data_mem[38] <= 32'd44;
data_mem[39] <= 32'd45;
data_mem[40] <= 32'd46;
data_mem[41] <= 32'd47;
data_mem[42] <= 32'd48;
data_mem[43] <= 32'd49;
data_mem[44] <= 32'd50;
data_mem[45] <= 32'd51;
data_mem[46] <= 32'd52;
data_mem[47] <= 32'd53;
data_mem[48] <= 32'd54;
data_mem[49] <= 32'd55;
data_mem[50] <= 32'd56;
data_mem[51] <= 32'd57;
data_mem[52] <= 32'd58;
data_mem[53] <= 32'd59;
data_mem[54] <= 32'd60;
data_mem[55] <= 32'd61;
data_mem[56] <= 32'd62;
data_mem[57] <= 32'd63;
data_mem[58] <= 32'd64;
data_mem[59] <= 32'd65;
data_mem[60] <= 32'd66;
data_mem[61] <= 32'd67;
data_mem[62] <= 32'd68;
data_mem[63] <= 32'd69;
data_mem[64] <= 32'd70;
data_mem[65] <= 32'd71;
data_mem[66] <= 32'd72;
data_mem[67] <= 32'd73;
data_mem[68] <= 32'd74;
data_mem[69] <= 32'd75;
data_mem[70] <= 32'd76;
data_mem[71] <= 32'd77;
data_mem[72] <= 32'd78;
data_mem[73] <= 32'd79;
data_mem[74] <= 32'd80;
data_mem[75] <= 32'd81;
data_mem[76] <= 32'd82;
data_mem[77] <= 32'd83;
data_mem[78] <= 32'd84;
data_mem[79] <= 32'd85;
data_mem[80] <= 32'd86;
data_mem[81] <= 32'd87;
data_mem[82] <= 32'd88;
data_mem[83] <= 32'd89;
data_mem[84] <= 32'd90;
data_mem[85] <= 32'd91;
data_mem[86] <= 32'd92;
data_mem[87] <= 32'd93;
data_mem[88] <= 32'd94;
data_mem[89] <= 32'd95;
data_mem[90] <= 32'd96;
data_mem[91] <= 32'd97;
data_mem[92] <= 32'd98;
data_mem[93] <= 32'd99;
data_mem[94] <= 32'd100;
data_mem[95] <= 32'd101;
data_mem[96] <= 32'd102;
data_mem[97] <= 32'd103;
data_mem[98] <= 32'd104;
data_mem[99] <= 32'd105;
data_mem[100] <= 32'd106;
data_mem[101] <= 32'd107;
data_mem[102] <= 32'd108;
data_mem[103] <= 32'd109;
data_mem[104] <= 32'd110;
data_mem[105] <= 32'd111;
data_mem[106] <= 32'd112;
data_mem[107] <= 32'd113;
data_mem[108] <= 32'd114;
data_mem[109] <= 32'd115;
data_mem[110] <= 32'd116;
data_mem[111] <= 32'd117;
data_mem[112] <= 32'd118;
data_mem[113] <= 32'd119;
data_mem[114] <= 32'd120;
data_mem[115] <= 32'd121;
data_mem[116] <= 32'd122;
data_mem[117] <= 32'd123;
data_mem[118] <= 32'd124;
data_mem[119] <= 32'd125;
data_mem[120] <= 32'd126;
data_mem[121] <= 32'd127;
data_mem[122] <= 32'd128;
data_mem[123] <= 32'd129;
data_mem[124] <= 32'd130;
data_mem[125] <= 32'd131;
data_mem[126] <= 32'd132;
data_mem[127] <= 32'd133;
data_mem[128] <= 32'd134;
data_mem[129] <= 32'd135;
data_mem[130] <= 32'd136;
data_mem[131] <= 32'd137;
data_mem[132] <= 32'd138;
data_mem[133] <= 32'd139;
data_mem[134] <= 32'd140;
data_mem[135] <= 32'd141;
data_mem[136] <= 32'd142;
data_mem[137] <= 32'd143;
data_mem[138] <= 32'd144;
data_mem[139] <= 32'd145;
data_mem[140] <= 32'd146;
data_mem[141] <= 32'd147;
data_mem[142] <= 32'd148;
data_mem[143] <= 32'd149;
data_mem[144] <= 32'd150;
data_mem[145] <= 32'd151;
data_mem[146] <= 32'd152;
data_mem[147] <= 32'd153;
data_mem[148] <= 32'd154;
data_mem[149] <= 32'd155;
data_mem[150] <= 32'd156;
data_mem[151] <= 32'd157;
data_mem[152] <= 32'd158;
data_mem[153] <= 32'd159;
data_mem[154] <= 32'd160;
data_mem[155] <= 32'd161;
data_mem[156] <= 32'd162;
data_mem[157] <= 32'd163;
data_mem[158] <= 32'd164;
data_mem[159] <= 32'd165;
data_mem[160] <= 32'd166;
data_mem[161] <= 32'd167;
data_mem[162] <= 32'd168;
data_mem[163] <= 32'd169;
data_mem[164] <= 32'd170;
data_mem[165] <= 32'd171;
data_mem[166] <= 32'd172;
data_mem[167] <= 32'd173;
data_mem[168] <= 32'd174;
data_mem[169] <= 32'd175;
data_mem[170] <= 32'd176;
data_mem[171] <= 32'd177;
data_mem[172] <= 32'd178;
data_mem[173] <= 32'd179;
data_mem[174] <= 32'd180;
data_mem[175] <= 32'd181;
data_mem[176] <= 32'd182;
data_mem[177] <= 32'd183;
data_mem[178] <= 32'd184;
data_mem[179] <= 32'd185;
data_mem[180] <= 32'd186;
data_mem[181] <= 32'd187;
data_mem[182] <= 32'd188;
data_mem[183] <= 32'd189;
data_mem[184] <= 32'd190;
data_mem[185] <= 32'd191;
data_mem[186] <= 32'd192;
data_mem[187] <= 32'd193;
data_mem[188] <= 32'd194;
data_mem[189] <= 32'd195;
data_mem[190] <= 32'd196;
data_mem[191] <= 32'd197;
data_mem[192] <= 32'd198;
data_mem[193] <= 32'd199;
data_mem[194] <= 32'd200;
data_mem[195] <= 32'd201;
data_mem[196] <= 32'd202;
data_mem[197] <= 32'd203;
data_mem[198] <= 32'd204;
data_mem[199] <= 32'd205;
data_mem[200] <= 32'd206;
data_mem[201] <= 32'd207;
data_mem[202] <= 32'd208;
data_mem[203] <= 32'd209;
data_mem[204] <= 32'd210;
data_mem[205] <= 32'd211;
data_mem[206] <= 32'd212;
data_mem[207] <= 32'd213;
data_mem[208] <= 32'd214;
data_mem[209] <= 32'd215;
data_mem[210] <= 32'd216;
data_mem[211] <= 32'd217;
data_mem[212] <= 32'd218;
data_mem[213] <= 32'd219;
data_mem[214] <= 32'd220;
data_mem[215] <= 32'd221;
data_mem[216] <= 32'd222;
data_mem[217] <= 32'd223;
data_mem[218] <= 32'd224;
data_mem[219] <= 32'd225;
data_mem[220] <= 32'd226;
data_mem[221] <= 32'd227;
data_mem[222] <= 32'd228;
data_mem[223] <= 32'd229;
data_mem[224] <= 32'd230;
data_mem[225] <= 32'd231;
data_mem[226] <= 32'd232;
data_mem[227] <= 32'd233;
data_mem[228] <= 32'd234;
data_mem[229] <= 32'd235;
data_mem[230] <= 32'd236;
data_mem[231] <= 32'd237;
data_mem[232] <= 32'd238;
data_mem[233] <= 32'd239;
data_mem[234] <= 32'd240;
data_mem[235] <= 32'd241;
data_mem[236] <= 32'd242;
data_mem[237] <= 32'd243;
data_mem[238] <= 32'd244;
data_mem[239] <= 32'd245;
data_mem[240] <= 32'd246;
data_mem[241] <= 32'd247;
data_mem[242] <= 32'd248;
data_mem[243] <= 32'd249;
data_mem[244] <= 32'd250;
data_mem[245] <= 32'd251;
data_mem[246] <= 32'd252;
data_mem[247] <= 32'd253;
data_mem[248] <= 32'd254;
data_mem[249] <= 32'd255;
data_mem[250] <= 32'd255;
data_mem[251] <= 32'd255;
data_mem[252] <= 32'd255;
data_mem[253] <= 32'd255;
data_mem[254] <= 32'd255;
data_mem[255] <= 32'd255;
			end
endmodule
