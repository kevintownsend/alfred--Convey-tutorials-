/*****************************************************************************/
//
// Module	   : cae_pers.vpp
// Revision	   : $Revision: 1.34 $
// Last Modified On: $Date: 2011/11/21 16:27:46 $
// Last Modified By: $Author: mruff $
//
//-----------------------------------------------------------------------------
//
// Original Author : gedwards
// Created On      : Wed Oct 10 09:26:08 2007
//
//-----------------------------------------------------------------------------
//
// Description     : Sample PDK Vector Add Personality
//
//                   Top-level of vadd personality.  For a complete list of
//                   optional ports, see
//                   /opt/convey/pdk/<rev>/<platform>/doc/cae_pers.v
//
//-----------------------------------------------------------------------------
//
// Copyright (c) 2007-2011 : created by Convey Computer Corp. This model is the
// confidential and proprietary property of Convey Computer Corp.
//
/*****************************************************************************/
/* $Id: cae_pers.vpp,v 1.34 2011/11/21 16:27:46 mruff Exp $ */

`timescale 1 ns / 1 ps

`include "pdk_fpga_defines.vh"
(* keep_hierarchy = "true" *)
module cae_pers (
   input		clk_csr,
   input		clk,
   input		clk2x,
   input		i_reset,
   input		i_csr_reset_n,
   input  [1:0]		i_aeid,

   input		ppll_reset,
   output		ppll_locked,
   output		clk_per,

   //
   // Dispatch Interface
   //
   input  [31:0]	cae_inst,
   input  [63:0]	cae_data,
   input		cae_inst_vld,

   output [17:0]	cae_aeg_cnt,
   output [15:0]	cae_exception,
   output [63:0]	cae_ret_data,
   output		cae_ret_data_vld,
   output		cae_idle,
   output		cae_stall,

   //
   // MC Interface(s)
   //
   output		mc0_req_ld_e, mc0_req_ld_o,
   output		mc0_req_st_e, mc0_req_st_o,
   output [1:0]		mc0_req_size_e, mc0_req_size_o,
   output [47:0]	mc0_req_vadr_e, mc0_req_vadr_o,
   output [63:0]	mc0_req_wrd_rdctl_e, mc0_req_wrd_rdctl_o,
   output		mc0_rsp_stall_e, mc0_rsp_stall_o,
   input		mc0_rd_rq_stall_e, mc0_rd_rq_stall_o,
   input		mc0_wr_rq_stall_e, mc0_wr_rq_stall_o,
   input  [63:0]	mc0_rsp_data_e, mc0_rsp_data_o,
   input		mc0_rsp_push_e, mc0_rsp_push_o,
   input  [31:0]	mc0_rsp_rdctl_e, mc0_rsp_rdctl_o,
   output		mc1_req_ld_e, mc1_req_ld_o,
   output		mc1_req_st_e, mc1_req_st_o,
   output [1:0]		mc1_req_size_e, mc1_req_size_o,
   output [47:0]	mc1_req_vadr_e, mc1_req_vadr_o,
   output [63:0]	mc1_req_wrd_rdctl_e, mc1_req_wrd_rdctl_o,
   output		mc1_rsp_stall_e, mc1_rsp_stall_o,
   input		mc1_rd_rq_stall_e, mc1_rd_rq_stall_o,
   input		mc1_wr_rq_stall_e, mc1_wr_rq_stall_o,
   input  [63:0]	mc1_rsp_data_e, mc1_rsp_data_o,
   input		mc1_rsp_push_e, mc1_rsp_push_o,
   input  [31:0]	mc1_rsp_rdctl_e, mc1_rsp_rdctl_o,
   output		mc2_req_ld_e, mc2_req_ld_o,
   output		mc2_req_st_e, mc2_req_st_o,
   output [1:0]		mc2_req_size_e, mc2_req_size_o,
   output [47:0]	mc2_req_vadr_e, mc2_req_vadr_o,
   output [63:0]	mc2_req_wrd_rdctl_e, mc2_req_wrd_rdctl_o,
   output		mc2_rsp_stall_e, mc2_rsp_stall_o,
   input		mc2_rd_rq_stall_e, mc2_rd_rq_stall_o,
   input		mc2_wr_rq_stall_e, mc2_wr_rq_stall_o,
   input  [63:0]	mc2_rsp_data_e, mc2_rsp_data_o,
   input		mc2_rsp_push_e, mc2_rsp_push_o,
   input  [31:0]	mc2_rsp_rdctl_e, mc2_rsp_rdctl_o,
   output		mc3_req_ld_e, mc3_req_ld_o,
   output		mc3_req_st_e, mc3_req_st_o,
   output [1:0]		mc3_req_size_e, mc3_req_size_o,
   output [47:0]	mc3_req_vadr_e, mc3_req_vadr_o,
   output [63:0]	mc3_req_wrd_rdctl_e, mc3_req_wrd_rdctl_o,
   output		mc3_rsp_stall_e, mc3_rsp_stall_o,
   input		mc3_rd_rq_stall_e, mc3_rd_rq_stall_o,
   input		mc3_wr_rq_stall_e, mc3_wr_rq_stall_o,
   input  [63:0]	mc3_rsp_data_e, mc3_rsp_data_o,
   input		mc3_rsp_push_e, mc3_rsp_push_o,
   input  [31:0]	mc3_rsp_rdctl_e, mc3_rsp_rdctl_o,
   output		mc4_req_ld_e, mc4_req_ld_o,
   output		mc4_req_st_e, mc4_req_st_o,
   output [1:0]		mc4_req_size_e, mc4_req_size_o,
   output [47:0]	mc4_req_vadr_e, mc4_req_vadr_o,
   output [63:0]	mc4_req_wrd_rdctl_e, mc4_req_wrd_rdctl_o,
   output		mc4_rsp_stall_e, mc4_rsp_stall_o,
   input		mc4_rd_rq_stall_e, mc4_rd_rq_stall_o,
   input		mc4_wr_rq_stall_e, mc4_wr_rq_stall_o,
   input  [63:0]	mc4_rsp_data_e, mc4_rsp_data_o,
   input		mc4_rsp_push_e, mc4_rsp_push_o,
   input  [31:0]	mc4_rsp_rdctl_e, mc4_rsp_rdctl_o,
   output		mc5_req_ld_e, mc5_req_ld_o,
   output		mc5_req_st_e, mc5_req_st_o,
   output [1:0]		mc5_req_size_e, mc5_req_size_o,
   output [47:0]	mc5_req_vadr_e, mc5_req_vadr_o,
   output [63:0]	mc5_req_wrd_rdctl_e, mc5_req_wrd_rdctl_o,
   output		mc5_rsp_stall_e, mc5_rsp_stall_o,
   input		mc5_rd_rq_stall_e, mc5_rd_rq_stall_o,
   input		mc5_wr_rq_stall_e, mc5_wr_rq_stall_o,
   input  [63:0]	mc5_rsp_data_e, mc5_rsp_data_o,
   input		mc5_rsp_push_e, mc5_rsp_push_o,
   input  [31:0]	mc5_rsp_rdctl_e, mc5_rsp_rdctl_o,
   output		mc6_req_ld_e, mc6_req_ld_o,
   output		mc6_req_st_e, mc6_req_st_o,
   output [1:0]		mc6_req_size_e, mc6_req_size_o,
   output [47:0]	mc6_req_vadr_e, mc6_req_vadr_o,
   output [63:0]	mc6_req_wrd_rdctl_e, mc6_req_wrd_rdctl_o,
   output		mc6_rsp_stall_e, mc6_rsp_stall_o,
   input		mc6_rd_rq_stall_e, mc6_rd_rq_stall_o,
   input		mc6_wr_rq_stall_e, mc6_wr_rq_stall_o,
   input  [63:0]	mc6_rsp_data_e, mc6_rsp_data_o,
   input		mc6_rsp_push_e, mc6_rsp_push_o,
   input  [31:0]	mc6_rsp_rdctl_e, mc6_rsp_rdctl_o,
   output		mc7_req_ld_e, mc7_req_ld_o,
   output		mc7_req_st_e, mc7_req_st_o,
   output [1:0]		mc7_req_size_e, mc7_req_size_o,
   output [47:0]	mc7_req_vadr_e, mc7_req_vadr_o,
   output [63:0]	mc7_req_wrd_rdctl_e, mc7_req_wrd_rdctl_o,
   output		mc7_rsp_stall_e, mc7_rsp_stall_o,
   input		mc7_rd_rq_stall_e, mc7_rd_rq_stall_o,
   input		mc7_wr_rq_stall_e, mc7_wr_rq_stall_o,
   input  [63:0]	mc7_rsp_data_e, mc7_rsp_data_o,
   input		mc7_rsp_push_e, mc7_rsp_push_o,
   input  [31:0]	mc7_rsp_rdctl_e, mc7_rsp_rdctl_o,

   //
   // Write flush
   //
`ifdef MC_WR_CMP_IF
   output [16:0] mc0_req_wrctl_e, mc0_req_wrctl_o,
   output mc0_wr_rsp_stall_e, mc0_wr_rsp_stall_o,
   input mc0_rsp_wrcmp_e, mc0_rsp_wrcmp_o,
   input [16:0] mc0_rsp_wrctl_e, mc0_rsp_wrctl_o,
   output [16:0] mc1_req_wrctl_e, mc1_req_wrctl_o,
   output mc1_wr_rsp_stall_e, mc1_wr_rsp_stall_o,
   input mc1_rsp_wrcmp_e, mc1_rsp_wrcmp_o,
   input [16:0] mc1_rsp_wrctl_e, mc1_rsp_wrctl_o,
   output [16:0] mc2_req_wrctl_e, mc2_req_wrctl_o,
   output mc2_wr_rsp_stall_e, mc2_wr_rsp_stall_o,
   input mc2_rsp_wrcmp_e, mc2_rsp_wrcmp_o,
   input [16:0] mc2_rsp_wrctl_e, mc2_rsp_wrctl_o,
   output [16:0] mc3_req_wrctl_e, mc3_req_wrctl_o,
   output mc3_wr_rsp_stall_e, mc3_wr_rsp_stall_o,
   input mc3_rsp_wrcmp_e, mc3_rsp_wrcmp_o,
   input [16:0] mc3_rsp_wrctl_e, mc3_rsp_wrctl_o,
   output [16:0] mc4_req_wrctl_e, mc4_req_wrctl_o,
   output mc4_wr_rsp_stall_e, mc4_wr_rsp_stall_o,
   input mc4_rsp_wrcmp_e, mc4_rsp_wrcmp_o,
   input [16:0] mc4_rsp_wrctl_e, mc4_rsp_wrctl_o,
   output [16:0] mc5_req_wrctl_e, mc5_req_wrctl_o,
   output mc5_wr_rsp_stall_e, mc5_wr_rsp_stall_o,
   input mc5_rsp_wrcmp_e, mc5_rsp_wrcmp_o,
   input [16:0] mc5_rsp_wrctl_e, mc5_rsp_wrctl_o,
   output [16:0] mc6_req_wrctl_e, mc6_req_wrctl_o,
   output mc6_wr_rsp_stall_e, mc6_wr_rsp_stall_o,
   input mc6_rsp_wrcmp_e, mc6_rsp_wrcmp_o,
   input [16:0] mc6_rsp_wrctl_e, mc6_rsp_wrctl_o,
   output [16:0] mc7_req_wrctl_e, mc7_req_wrctl_o,
   output mc7_wr_rsp_stall_e, mc7_wr_rsp_stall_o,
   input mc7_rsp_wrcmp_e, mc7_rsp_wrcmp_o,
   input [16:0] mc7_rsp_wrctl_e, mc7_rsp_wrctl_o,
`else
   output		mc0_req_flush_e, mc0_req_flush_o,
   input		mc0_rsp_flush_cmplt_e, mc0_rsp_flush_cmplt_o,
   output		mc1_req_flush_e, mc1_req_flush_o,
   input		mc1_rsp_flush_cmplt_e, mc1_rsp_flush_cmplt_o,
   output		mc2_req_flush_e, mc2_req_flush_o,
   input		mc2_rsp_flush_cmplt_e, mc2_rsp_flush_cmplt_o,
   output		mc3_req_flush_e, mc3_req_flush_o,
   input		mc3_rsp_flush_cmplt_e, mc3_rsp_flush_cmplt_o,
   output		mc4_req_flush_e, mc4_req_flush_o,
   input		mc4_rsp_flush_cmplt_e, mc4_rsp_flush_cmplt_o,
   output		mc5_req_flush_e, mc5_req_flush_o,
   input		mc5_rsp_flush_cmplt_e, mc5_rsp_flush_cmplt_o,
   output		mc6_req_flush_e, mc6_req_flush_o,
   input		mc6_rsp_flush_cmplt_e, mc6_rsp_flush_cmplt_o,
   output		mc7_req_flush_e, mc7_req_flush_o,
   input		mc7_rsp_flush_cmplt_e, mc7_rsp_flush_cmplt_o,
`endif

   //
   // AE-to-AE Interface not used
   //

   //
   // Management/Debug Interface
   //
   input  [3:0]		cae_ring_ctl_in,
   input  [15:0]	cae_ring_data_in,
   output [3:0]		cae_ring_ctl_out,
   output [15:0]	cae_ring_data_out,

   input		csr_31_31_intlv_dis
);

`include "pdk_fpga_param.vh"
`include "mc_pack.vh"

   //
   // Local clock generation
   //
   (* KEEP = "true" *) wire reset_per;
   cae_clock clock (
      .clk(clk),
      .i_reset(i_reset),
      .ppll_reset(ppll_reset),

      .clk_per(clk_per),
      .ppll_locked(ppll_locked),
      .reset_per(reset_per)
   );


   //
   // Instruction decode
   //
   wire [4:0]	inst_caep;
   wire [17:0]	inst_aeg_idx;
   instdec dec (
      .cae_inst(cae_inst),
      .cae_data(cae_data),
      .cae_inst_vld(cae_inst_vld),

      .inst_val(inst_val),
      .inst_caep(inst_caep),
      .inst_aeg_wr(inst_aeg_wr),
      .inst_aeg_rd(inst_aeg_rd),
      .inst_aeg_idx(inst_aeg_idx),
      .err_unimpl(err_unimpl)
   );


	//
	// Personality
	//
	personality leroy (
		.clock(clk_per),
		.reset(reset_per),
		.aeid(i_aeid),

		// Dispatch Interface
		.aeg_write(inst_aeg_wr),
		.aeg_read(inst_aeg_rd),
		.aeg_index(inst_aeg_idx),
		.aeg_data(cae_data),
		.aeg_count(cae_aeg_cnt),


		.instruction_caep(inst_caep),
		.instruction_valid(inst_val),

		.return_data(cae_ret_data),
		.return_data_valid(cae_ret_data_vld),

		.exception(cae_exception),

		.idle(cae_idle),
		.stall(cae_stall),

		// MC Interface (request ports)
		.mc_req_ld(mc_req_ld_packed),
		.mc_req_st(mc_req_st_packed),
		.mc_req_size_packed(mc_req_size_packed),
		.mc_req_vadr_packed(mc_req_vadr_packed),
		.mc_req_wrd_rdctl_packed(mc_req_wrd_rdctl_packed),
		.mc_rd_rq_stall(mc_rd_rq_stall_packed),
		.mc_wr_rq_stall(mc_wr_rq_stall_packed),
		// MC Interfae (response ports)
		.mc_rsp_stall(mc_rsp_stall_packed),
		.mc_rsp_push(mc_rsp_push_packed),
		.mc_rsp_data_packed(mc_rsp_data_packed),
		.mc_rsp_rdctl_packed(mc_rsp_rdctl_packed),

`ifdef MC_WR_CMP_IF
      // Write complete IF
      .mc_req_wrctl_packed(mc_req_wrctl_packed),
      .mc_rsp_wrctl_packed(mc_rsp_wrctl_packed),
      .mc_rsp_wrcmp(mc_rsp_wrcmp_packed),
      .mc_wr_rsp_stall(mc_wr_rsp_stall_packed)
`else
      // Write flush IF
      .mc_req_flush(mc_req_flush_packed),
      .mc_rsp_flush_cmplt(mc_rsp_flush_cmplt_packed)
`endif

	);

	// ISE can have issues with global wires attached to D(flop)/I(lut) inputs
	wire r_reset;
	FDSE rst(.C(clk_per),.S(reset_per),.CE(r_reset),.D(!r_reset),.Q(r_reset));

	// No CSR
	assign cae_ring_ctl_out = cae_ring_ctl_in;
	assign cae_ring_data_out = cae_ring_data_in;

endmodule
