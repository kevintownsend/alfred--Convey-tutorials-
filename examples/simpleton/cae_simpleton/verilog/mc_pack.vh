`ifndef __mc_pack_vh_
`define __mc_pack_vh_

	// Make MC's into an array format
	wire [15:0]   mc_req_ld_packed;
	wire [15:0]   mc_req_st_packed;
    wire [31:0]   mc_req_size_packed;
	wire [767:0]  mc_req_vadr_packed;
	wire [1023:0] mc_req_wrd_rdctl_packed;
	wire [15:0]   mc_rd_rq_stall_packed;
	wire [15:0]   mc_wr_rq_stall_packed;

	wire [15:0]   mc_rsp_stall_packed;
	wire [15:0]   mc_rsp_push_packed;
	wire [1023:0] mc_rsp_data_packed;
	wire [511:0]  mc_rsp_rdctl_packed;



	// Request Ports
	assign mc0_req_ld_e = mc_req_ld_packed[0];
	assign mc0_req_ld_o = mc_req_ld_packed[1];
	assign mc1_req_ld_e = mc_req_ld_packed[2];
	assign mc1_req_ld_o = mc_req_ld_packed[3];
	assign mc2_req_ld_e = mc_req_ld_packed[4];
	assign mc2_req_ld_o = mc_req_ld_packed[5];
	assign mc3_req_ld_e = mc_req_ld_packed[6];
	assign mc3_req_ld_o = mc_req_ld_packed[7];
	assign mc4_req_ld_e = mc_req_ld_packed[8];
	assign mc4_req_ld_o = mc_req_ld_packed[9];
	assign mc5_req_ld_e = mc_req_ld_packed[10];
	assign mc5_req_ld_o = mc_req_ld_packed[11];
	assign mc6_req_ld_e = mc_req_ld_packed[12];
	assign mc6_req_ld_o = mc_req_ld_packed[13];
	assign mc7_req_ld_e = mc_req_ld_packed[14];
	assign mc7_req_ld_o = mc_req_ld_packed[15];
	assign mc0_req_st_e = mc_req_st_packed[0];
	assign mc0_req_st_o = mc_req_st_packed[1];
	assign mc1_req_st_e = mc_req_st_packed[2];
	assign mc1_req_st_o = mc_req_st_packed[3];
	assign mc2_req_st_e = mc_req_st_packed[4];
	assign mc2_req_st_o = mc_req_st_packed[5];
	assign mc3_req_st_e = mc_req_st_packed[6];
	assign mc3_req_st_o = mc_req_st_packed[7];
	assign mc4_req_st_e = mc_req_st_packed[8];
	assign mc4_req_st_o = mc_req_st_packed[9];
	assign mc5_req_st_e = mc_req_st_packed[10];
	assign mc5_req_st_o = mc_req_st_packed[11];
	assign mc6_req_st_e = mc_req_st_packed[12];
	assign mc6_req_st_o = mc_req_st_packed[13];
	assign mc7_req_st_e = mc_req_st_packed[14];
	assign mc7_req_st_o = mc_req_st_packed[15];
	assign mc0_req_size_e = mc_req_size_packed[1:0];
	assign mc0_req_size_o = mc_req_size_packed[3:2];
	assign mc1_req_size_e = mc_req_size_packed[5:4];
	assign mc1_req_size_o = mc_req_size_packed[7:6];
	assign mc2_req_size_e = mc_req_size_packed[9:8];
	assign mc2_req_size_o = mc_req_size_packed[11:10];
	assign mc3_req_size_e = mc_req_size_packed[13:12];
	assign mc3_req_size_o = mc_req_size_packed[15:14];
	assign mc4_req_size_e = mc_req_size_packed[17:16];
	assign mc4_req_size_o = mc_req_size_packed[19:18];
	assign mc5_req_size_e = mc_req_size_packed[21:20];
	assign mc5_req_size_o = mc_req_size_packed[23:22];
	assign mc6_req_size_e = mc_req_size_packed[25:24];
	assign mc6_req_size_o = mc_req_size_packed[27:26];
	assign mc7_req_size_e = mc_req_size_packed[29:28];
	assign mc7_req_size_o = mc_req_size_packed[31:30];
	assign mc0_req_vadr_e = mc_req_vadr_packed[47:0];
	assign mc0_req_vadr_o = mc_req_vadr_packed[95:48];
	assign mc1_req_vadr_e = mc_req_vadr_packed[143:96];
	assign mc1_req_vadr_o = mc_req_vadr_packed[191:144];
	assign mc2_req_vadr_e = mc_req_vadr_packed[239:192];
	assign mc2_req_vadr_o = mc_req_vadr_packed[287:240];
	assign mc3_req_vadr_e = mc_req_vadr_packed[335:288];
	assign mc3_req_vadr_o = mc_req_vadr_packed[383:336];
	assign mc4_req_vadr_e = mc_req_vadr_packed[431:384];
	assign mc4_req_vadr_o = mc_req_vadr_packed[479:432];
	assign mc5_req_vadr_e = mc_req_vadr_packed[527:480];
	assign mc5_req_vadr_o = mc_req_vadr_packed[575:528];
	assign mc6_req_vadr_e = mc_req_vadr_packed[623:576];
	assign mc6_req_vadr_o = mc_req_vadr_packed[671:624];
	assign mc7_req_vadr_e = mc_req_vadr_packed[719:672];
	assign mc7_req_vadr_o = mc_req_vadr_packed[767:720];
	assign mc0_req_wrd_rdctl_e = mc_req_wrd_rdctl_packed[63:0];
	assign mc0_req_wrd_rdctl_o = mc_req_wrd_rdctl_packed[127:64];
	assign mc1_req_wrd_rdctl_e = mc_req_wrd_rdctl_packed[191:128];
	assign mc1_req_wrd_rdctl_o = mc_req_wrd_rdctl_packed[255:192];
	assign mc2_req_wrd_rdctl_e = mc_req_wrd_rdctl_packed[319:256];
	assign mc2_req_wrd_rdctl_o = mc_req_wrd_rdctl_packed[383:320];
	assign mc3_req_wrd_rdctl_e = mc_req_wrd_rdctl_packed[447:384];
	assign mc3_req_wrd_rdctl_o = mc_req_wrd_rdctl_packed[511:448];
	assign mc4_req_wrd_rdctl_e = mc_req_wrd_rdctl_packed[575:512];
	assign mc4_req_wrd_rdctl_o = mc_req_wrd_rdctl_packed[639:576];
	assign mc5_req_wrd_rdctl_e = mc_req_wrd_rdctl_packed[703:640];
	assign mc5_req_wrd_rdctl_o = mc_req_wrd_rdctl_packed[767:704];
	assign mc6_req_wrd_rdctl_e = mc_req_wrd_rdctl_packed[831:768];
	assign mc6_req_wrd_rdctl_o = mc_req_wrd_rdctl_packed[895:832];
	assign mc7_req_wrd_rdctl_e = mc_req_wrd_rdctl_packed[959:896];
	assign mc7_req_wrd_rdctl_o = mc_req_wrd_rdctl_packed[1023:960];
   	assign mc_rd_rq_stall_packed[0] = mc0_rd_rq_stall_e;
	assign mc_rd_rq_stall_packed[1] = mc0_rd_rq_stall_o;
	assign mc_rd_rq_stall_packed[2] = mc1_rd_rq_stall_e;
	assign mc_rd_rq_stall_packed[3] = mc1_rd_rq_stall_o;
	assign mc_rd_rq_stall_packed[4] = mc2_rd_rq_stall_e;
	assign mc_rd_rq_stall_packed[5] = mc2_rd_rq_stall_o;
	assign mc_rd_rq_stall_packed[6] = mc3_rd_rq_stall_e;
	assign mc_rd_rq_stall_packed[7] = mc3_rd_rq_stall_o;
	assign mc_rd_rq_stall_packed[8] = mc4_rd_rq_stall_e;
	assign mc_rd_rq_stall_packed[9] = mc4_rd_rq_stall_o;
	assign mc_rd_rq_stall_packed[10] = mc5_rd_rq_stall_e;
	assign mc_rd_rq_stall_packed[11] = mc5_rd_rq_stall_o;
	assign mc_rd_rq_stall_packed[12] = mc6_rd_rq_stall_e;
	assign mc_rd_rq_stall_packed[13] = mc6_rd_rq_stall_o;
	assign mc_rd_rq_stall_packed[14] = mc7_rd_rq_stall_e;
	assign mc_rd_rq_stall_packed[15] = mc7_rd_rq_stall_o;
	assign mc_wr_rq_stall_packed[0] = mc0_wr_rq_stall_e;
	assign mc_wr_rq_stall_packed[1] = mc0_wr_rq_stall_o;
	assign mc_wr_rq_stall_packed[2] = mc1_wr_rq_stall_e;
	assign mc_wr_rq_stall_packed[3] = mc1_wr_rq_stall_o;
	assign mc_wr_rq_stall_packed[4] = mc2_wr_rq_stall_e;
	assign mc_wr_rq_stall_packed[5] = mc2_wr_rq_stall_o;
	assign mc_wr_rq_stall_packed[6] = mc3_wr_rq_stall_e;
	assign mc_wr_rq_stall_packed[7] = mc3_wr_rq_stall_o;
	assign mc_wr_rq_stall_packed[8] = mc4_wr_rq_stall_e;
	assign mc_wr_rq_stall_packed[9] = mc4_wr_rq_stall_o;
	assign mc_wr_rq_stall_packed[10] = mc5_wr_rq_stall_e;
	assign mc_wr_rq_stall_packed[11] = mc5_wr_rq_stall_o;
	assign mc_wr_rq_stall_packed[12] = mc6_wr_rq_stall_e;
	assign mc_wr_rq_stall_packed[13] = mc6_wr_rq_stall_o;
	assign mc_wr_rq_stall_packed[14] = mc7_wr_rq_stall_e;
	assign mc_wr_rq_stall_packed[15] = mc7_wr_rq_stall_o;


	// Response ports
	assign mc0_rsp_stall_e = mc_rsp_stall_packed[0];
	assign mc0_rsp_stall_o = mc_rsp_stall_packed[1];
	assign mc1_rsp_stall_e = mc_rsp_stall_packed[2];
	assign mc1_rsp_stall_o = mc_rsp_stall_packed[3];
	assign mc2_rsp_stall_e = mc_rsp_stall_packed[4];
	assign mc2_rsp_stall_o = mc_rsp_stall_packed[5];
	assign mc3_rsp_stall_e = mc_rsp_stall_packed[6];
	assign mc3_rsp_stall_o = mc_rsp_stall_packed[7];
	assign mc4_rsp_stall_e = mc_rsp_stall_packed[8];
	assign mc4_rsp_stall_o = mc_rsp_stall_packed[9];
	assign mc5_rsp_stall_e = mc_rsp_stall_packed[10];
	assign mc5_rsp_stall_o = mc_rsp_stall_packed[11];
	assign mc6_rsp_stall_e = mc_rsp_stall_packed[12];
	assign mc6_rsp_stall_o = mc_rsp_stall_packed[13];
	assign mc7_rsp_stall_e = mc_rsp_stall_packed[14];
	assign mc7_rsp_stall_o = mc_rsp_stall_packed[15];
	assign mc_rsp_push_packed[0] = mc0_rsp_push_e;
	assign mc_rsp_push_packed[1] = mc0_rsp_push_o;
	assign mc_rsp_push_packed[2] = mc1_rsp_push_e;
	assign mc_rsp_push_packed[3] = mc1_rsp_push_o;
	assign mc_rsp_push_packed[4] = mc2_rsp_push_e;
	assign mc_rsp_push_packed[5] = mc2_rsp_push_o;
	assign mc_rsp_push_packed[6] = mc3_rsp_push_e;
	assign mc_rsp_push_packed[7] = mc3_rsp_push_o;
	assign mc_rsp_push_packed[8] = mc4_rsp_push_e;
	assign mc_rsp_push_packed[9] = mc4_rsp_push_o;
	assign mc_rsp_push_packed[10] = mc5_rsp_push_e;
	assign mc_rsp_push_packed[11] = mc5_rsp_push_o;
	assign mc_rsp_push_packed[12] = mc6_rsp_push_e;
	assign mc_rsp_push_packed[13] = mc6_rsp_push_o;
	assign mc_rsp_push_packed[14] = mc7_rsp_push_e;
	assign mc_rsp_push_packed[15] = mc7_rsp_push_o;
	assign mc_rsp_data_packed[63:0] = mc0_rsp_data_e;
	assign mc_rsp_data_packed[127:64] = mc0_rsp_data_o;
	assign mc_rsp_data_packed[191:128] = mc1_rsp_data_e;
	assign mc_rsp_data_packed[255:192] = mc1_rsp_data_o;
	assign mc_rsp_data_packed[319:256] = mc2_rsp_data_e;
	assign mc_rsp_data_packed[383:320] = mc2_rsp_data_o;
	assign mc_rsp_data_packed[447:384] = mc3_rsp_data_e;
	assign mc_rsp_data_packed[511:448] = mc3_rsp_data_o;
	assign mc_rsp_data_packed[575:512] = mc4_rsp_data_e;
	assign mc_rsp_data_packed[639:576] = mc4_rsp_data_o;
	assign mc_rsp_data_packed[703:640] = mc5_rsp_data_e;
	assign mc_rsp_data_packed[767:704] = mc5_rsp_data_o;
	assign mc_rsp_data_packed[831:768] = mc6_rsp_data_e;
	assign mc_rsp_data_packed[895:832] = mc6_rsp_data_o;
	assign mc_rsp_data_packed[959:896] = mc7_rsp_data_e;
	assign mc_rsp_data_packed[1023:960] = mc7_rsp_data_o;
	assign mc_rsp_rdctl_packed[31:0] = mc0_rsp_rdctl_e;
	assign mc_rsp_rdctl_packed[63:32] = mc0_rsp_rdctl_o;
	assign mc_rsp_rdctl_packed[95:64] = mc1_rsp_rdctl_e;
	assign mc_rsp_rdctl_packed[127:96] = mc1_rsp_rdctl_o;
	assign mc_rsp_rdctl_packed[159:128] = mc2_rsp_rdctl_e;
	assign mc_rsp_rdctl_packed[191:160] = mc2_rsp_rdctl_o;
	assign mc_rsp_rdctl_packed[223:192] = mc3_rsp_rdctl_e;
	assign mc_rsp_rdctl_packed[255:224] = mc3_rsp_rdctl_o;
	assign mc_rsp_rdctl_packed[287:256] = mc4_rsp_rdctl_e;
	assign mc_rsp_rdctl_packed[319:288] = mc4_rsp_rdctl_o;
	assign mc_rsp_rdctl_packed[351:320] = mc5_rsp_rdctl_e;
	assign mc_rsp_rdctl_packed[383:352] = mc5_rsp_rdctl_o;
	assign mc_rsp_rdctl_packed[415:384] = mc6_rsp_rdctl_e;
	assign mc_rsp_rdctl_packed[447:416] = mc6_rsp_rdctl_o;
	assign mc_rsp_rdctl_packed[479:448] = mc7_rsp_rdctl_e;
	assign mc_rsp_rdctl_packed[511:480] = mc7_rsp_rdctl_o;


`ifdef MC_WR_CMP_IF
	wire [271:0]  mc_req_wrctl_packed; // out
	wire [271:0]  mc_rsp_wrctl_packed; // in
	wire [15:0]   mc_rsp_wrcmp_packed; // in
	wire [15:0]   mc_wr_rsp_stall_packed; // out

	assign mc0_req_wrctl_e = mc_req_wrctl_packed[16:0];
	assign mc0_req_wrctl_o = mc_req_wrctl_packed[33:17];
	assign mc1_req_wrctl_e = mc_req_wrctl_packed[50:34];
	assign mc1_req_wrctl_o = mc_req_wrctl_packed[67:51];
	assign mc2_req_wrctl_e = mc_req_wrctl_packed[84:68];
	assign mc2_req_wrctl_o = mc_req_wrctl_packed[101:85];
	assign mc3_req_wrctl_e = mc_req_wrctl_packed[118:102];
	assign mc3_req_wrctl_o = mc_req_wrctl_packed[135:119];
	assign mc4_req_wrctl_e = mc_req_wrctl_packed[152:136];
	assign mc4_req_wrctl_o = mc_req_wrctl_packed[169:153];
	assign mc5_req_wrctl_e = mc_req_wrctl_packed[186:170];
	assign mc5_req_wrctl_o = mc_req_wrctl_packed[203:187];
	assign mc6_req_wrctl_e = mc_req_wrctl_packed[220:204];
	assign mc6_req_wrctl_o = mc_req_wrctl_packed[237:221];
	assign mc7_req_wrctl_e = mc_req_wrctl_packed[254:238];
	assign mc7_req_wrctl_o = mc_req_wrctl_packed[271:255];
	assign mc_rsp_wrctl_packed[16:0] = mc0_rsp_wrctl_e;
	assign mc_rsp_wrctl_packed[33:17] = mc0_rsp_wrctl_o;
	assign mc_rsp_wrctl_packed[50:34] = mc1_rsp_wrctl_e;
	assign mc_rsp_wrctl_packed[67:51] = mc1_rsp_wrctl_o;
	assign mc_rsp_wrctl_packed[84:68] = mc2_rsp_wrctl_e;
	assign mc_rsp_wrctl_packed[101:85] = mc2_rsp_wrctl_o;
	assign mc_rsp_wrctl_packed[118:102] = mc3_rsp_wrctl_e;
	assign mc_rsp_wrctl_packed[135:119] = mc3_rsp_wrctl_o;
	assign mc_rsp_wrctl_packed[152:136] = mc4_rsp_wrctl_e;
	assign mc_rsp_wrctl_packed[169:153] = mc4_rsp_wrctl_o;
	assign mc_rsp_wrctl_packed[186:170] = mc5_rsp_wrctl_e;
	assign mc_rsp_wrctl_packed[203:187] = mc5_rsp_wrctl_o;
	assign mc_rsp_wrctl_packed[220:204] = mc6_rsp_wrctl_e;
	assign mc_rsp_wrctl_packed[237:221] = mc6_rsp_wrctl_o;
	assign mc_rsp_wrctl_packed[254:238] = mc7_rsp_wrctl_e;
	assign mc_rsp_wrctl_packed[271:255] = mc7_rsp_wrctl_o;
	assign mc0_wr_rsp_stall_e = mc_wr_rsp_stall_packed[0];
	assign mc0_wr_rsp_stall_o = mc_wr_rsp_stall_packed[1];
	assign mc1_wr_rsp_stall_e = mc_wr_rsp_stall_packed[2];
	assign mc1_wr_rsp_stall_o = mc_wr_rsp_stall_packed[3];
	assign mc2_wr_rsp_stall_e = mc_wr_rsp_stall_packed[4];
	assign mc2_wr_rsp_stall_o = mc_wr_rsp_stall_packed[5];
	assign mc3_wr_rsp_stall_e = mc_wr_rsp_stall_packed[6];
	assign mc3_wr_rsp_stall_o = mc_wr_rsp_stall_packed[7];
	assign mc4_wr_rsp_stall_e = mc_wr_rsp_stall_packed[8];
	assign mc4_wr_rsp_stall_o = mc_wr_rsp_stall_packed[9];
	assign mc5_wr_rsp_stall_e = mc_wr_rsp_stall_packed[10];
	assign mc5_wr_rsp_stall_o = mc_wr_rsp_stall_packed[11];
	assign mc6_wr_rsp_stall_e = mc_wr_rsp_stall_packed[12];
	assign mc6_wr_rsp_stall_o = mc_wr_rsp_stall_packed[13];
	assign mc7_wr_rsp_stall_e = mc_wr_rsp_stall_packed[14];
	assign mc7_wr_rsp_stall_o = mc_wr_rsp_stall_packed[15];
	assign mc_rsp_wrcmp_packed[0] = mc0_rsp_wrcmp_e;
	assign mc_rsp_wrcmp_packed[1] = mc0_rsp_wrcmp_o;
	assign mc_rsp_wrcmp_packed[2] = mc1_rsp_wrcmp_e;
	assign mc_rsp_wrcmp_packed[3] = mc1_rsp_wrcmp_o;
	assign mc_rsp_wrcmp_packed[4] = mc2_rsp_wrcmp_e;
	assign mc_rsp_wrcmp_packed[5] = mc2_rsp_wrcmp_o;
	assign mc_rsp_wrcmp_packed[6] = mc3_rsp_wrcmp_e;
	assign mc_rsp_wrcmp_packed[7] = mc3_rsp_wrcmp_o;
	assign mc_rsp_wrcmp_packed[8] = mc4_rsp_wrcmp_e;
	assign mc_rsp_wrcmp_packed[9] = mc4_rsp_wrcmp_o;
	assign mc_rsp_wrcmp_packed[10] = mc5_rsp_wrcmp_e;
	assign mc_rsp_wrcmp_packed[11] = mc5_rsp_wrcmp_o;
	assign mc_rsp_wrcmp_packed[12] = mc6_rsp_wrcmp_e;
	assign mc_rsp_wrcmp_packed[13] = mc6_rsp_wrcmp_o;
	assign mc_rsp_wrcmp_packed[14] = mc7_rsp_wrcmp_e;
	assign mc_rsp_wrcmp_packed[15] = mc7_rsp_wrcmp_o;
`else
	wire [15:0]   mc_req_flush_packed;
	wire [15:0]   mc_rsp_flush_cmplt_packed;

	assign mc0_req_flush_e = mc_req_flush_packed[0];
	assign mc0_req_flush_o = mc_req_flush_packed[1];
	assign mc1_req_flush_e = mc_req_flush_packed[2];
	assign mc1_req_flush_o = mc_req_flush_packed[3];
	assign mc2_req_flush_e = mc_req_flush_packed[4];
	assign mc2_req_flush_o = mc_req_flush_packed[5];
	assign mc3_req_flush_e = mc_req_flush_packed[6];
	assign mc3_req_flush_o = mc_req_flush_packed[7];
	assign mc4_req_flush_e = mc_req_flush_packed[8];
	assign mc4_req_flush_o = mc_req_flush_packed[9];
	assign mc5_req_flush_e = mc_req_flush_packed[10];
	assign mc5_req_flush_o = mc_req_flush_packed[11];
	assign mc6_req_flush_e = mc_req_flush_packed[12];
	assign mc6_req_flush_o = mc_req_flush_packed[13];
	assign mc7_req_flush_e = mc_req_flush_packed[14];
	assign mc7_req_flush_o = mc_req_flush_packed[15];
	assign mc_rsp_flush_cmplt_packed[0] = mc0_rsp_flush_cmplt_e;
	assign mc_rsp_flush_cmplt_packed[1] = mc0_rsp_flush_cmplt_o;
	assign mc_rsp_flush_cmplt_packed[2] = mc1_rsp_flush_cmplt_e;
	assign mc_rsp_flush_cmplt_packed[3] = mc1_rsp_flush_cmplt_o;
	assign mc_rsp_flush_cmplt_packed[4] = mc2_rsp_flush_cmplt_e;
	assign mc_rsp_flush_cmplt_packed[5] = mc2_rsp_flush_cmplt_o;
	assign mc_rsp_flush_cmplt_packed[6] = mc3_rsp_flush_cmplt_e;
	assign mc_rsp_flush_cmplt_packed[7] = mc3_rsp_flush_cmplt_o;
	assign mc_rsp_flush_cmplt_packed[8] = mc4_rsp_flush_cmplt_e;
	assign mc_rsp_flush_cmplt_packed[9] = mc4_rsp_flush_cmplt_o;
	assign mc_rsp_flush_cmplt_packed[10] = mc5_rsp_flush_cmplt_e;
	assign mc_rsp_flush_cmplt_packed[11] = mc5_rsp_flush_cmplt_o;
	assign mc_rsp_flush_cmplt_packed[12] = mc6_rsp_flush_cmplt_e;
	assign mc_rsp_flush_cmplt_packed[13] = mc6_rsp_flush_cmplt_o;
	assign mc_rsp_flush_cmplt_packed[14] = mc7_rsp_flush_cmplt_e;
	assign mc_rsp_flush_cmplt_packed[15] = mc7_rsp_flush_cmplt_o;
`endif

`endif