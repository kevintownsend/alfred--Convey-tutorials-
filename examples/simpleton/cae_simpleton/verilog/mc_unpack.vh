`ifndef __mc_unpack_vh_
`define __mc_unpack_vh_

	// Assign MC's from packed to unpacked array format

	// Unpack memory controllers into 2D arrays
    wire [1 :0] mc_req_size      [15:0];
	wire [47:0] mc_req_vadr      [15:0];
	wire [63:0] mc_req_wrd_rdctl [15:0];
	wire [63:0] mc_rsp_data      [15:0];
	wire [31:0] mc_rsp_rdctl     [15:0];

`ifdef MC_WR_CMP_IF
	wire [16:0] mc_req_wrctl     [15:0];
	wire [16:0] mc_rsp_wrctl     [15:0];
`endif

	genvar n;
	generate for (n=0; n<16; n=n+1)
	begin : unpack_generate
		assign mc_req_size_packed      [( 2*n+ 1):( 2*n)] = mc_req_size      [n][1:0];
		assign mc_req_vadr_packed      [(48*n+47):(48*n)] = mc_req_vadr      [n][47:0];
		assign mc_req_wrd_rdctl_packed [(64*n+63):(64*n)] = mc_req_wrd_rdctl [n][63:0];
`ifdef MC_WR_CMP_IF
		assign mc_req_wrctl_packed     [(17*n+16):(17*n)] = mc_req_wrctl     [n][16:0];

		assign mc_rsp_wrctl [n][16:0] = mc_rsp_wrctl_packed [(17*n+16):(17*n)];
`endif
		assign mc_rsp_data  [n][63:0] = mc_rsp_data_packed  [(64*n+63):(64*n)];
		assign mc_rsp_rdctl [n][31:0] = mc_rsp_rdctl_packed [(32*n+31):(32*n)];
	end endgenerate

`endif
