`timescale 1 ns / 1 ps

`include "pdk_fpga_defines.vh"

module personality (
	input         clock,
	input  [1 :0] aeid,
	
	// Instruction Dispatch Interface
	input         aeg_write,
	input         aeg_read,
	input  [17:0] aeg_index,
	input  [63:0] aeg_data,
	output [17:0] aeg_count,
	
	input  [4 :0] instruction_caep,
	input         instruction_valid,
	
	output [63:0] return_data,
	output        return_data_valid,
	
	output [15:0] exception,
	
	input         reset,
	output        idle,
	output        stall,
	
	// MC Interface (request ports)
	output [15:0]   mc_req_ld,
	output [15:0]   mc_req_st,
	output [31:0]   mc_req_size_packed,
	output [767:0]  mc_req_vadr_packed,
	output [1023:0] mc_req_wrd_rdctl_packed,
	input  [15:0]   mc_rd_rq_stall,
	input  [15:0]   mc_wr_rq_stall,
	
	// MC Interfae (response ports)
	output [15:0]   mc_rsp_stall,
	input  [15:0]   mc_rsp_push,
	input  [1023:0] mc_rsp_data_packed,
	input  [511:0]  mc_rsp_rdctl_packed,

	// The developer can choose between the write flush and more 
	// complex write complete interface in the project's Makefile
`ifdef MC_WR_CMP_IF
	// Write complete interface
	output [271:0]  mc_req_wrctl_packed,
	input  [271:0]  mc_rsp_wrctl_packed,
	input  [15:0]   mc_rsp_wrcmp,
	output [15:0]   mc_wr_rsp_stall
`else
	// Write flush interface
	output [15:0]   mc_req_flush,
	input  [15:0]   mc_rsp_flush_cmplt
`endif
);

`include "pdk_fpga_param.vh"
`include "mc_unpack.vh"

	// Define states of state machine
	parameter IDLE = 0;
	parameter CAEP00_INC = 1, CAEP00_WAIT = 2;
	parameter CAEP01_READ = 3, CAEP01_WAIT = 4, CAEP01_WRITE = 5;
	reg [2:0] current_state;

	
	
	// Handle AEG read and write instructions
	localparam max_aeg_index = 50;
	wire [63:0] aeg_registers[max_aeg_index:0];
	
	generate for (n=0; n<=max_aeg_index; n=n+1)
	begin : aeg_generate
		reg [63:0] aeg;

		always @(posedge clock) 
		begin
			if (aeg_write && aeg_index == n)
				aeg <= aeg_data;
			else if (current_state == CAEP00_INC && n == 0)
				aeg <= aeg + 1;
			else
				aeg <= aeg;
		end
		
		assign aeg_registers[n] = aeg;
		
	end endgenerate
	
	assign aeg_count = max_aeg_index + 1; 
	assign return_data_valid = aeg_read && (aeg_index <= max_aeg_index);
	assign return_data = aeg_registers[aeg_index];
	assign exception = 0;


	// Handle state machine transistions
	always @ (posedge clock)
	begin
		if (reset)
			current_state <= IDLE;
		else 
			case (current_state)
				IDLE:
					begin
						if (instruction_valid == 1 && instruction_caep == 0)
							current_state <= CAEP00_INC;
						else if (instruction_valid == 1 && instruction_caep == 1)
							current_state <= CAEP01_READ;
					end
				CAEP00_INC: // Strobe
					begin
						current_state <= CAEP00_WAIT;
					end
				CAEP00_WAIT:
					begin
						current_state <= IDLE;
					end
				CAEP01_READ: // Strobe
					begin
						current_state <= CAEP01_WAIT;
					end
				CAEP01_WAIT:
					begin
						if (mc_rsp_push[0])
							current_state <= CAEP01_WRITE;
					end
				CAEP01_WRITE: // Strobe
					begin
						current_state <= IDLE;
					end
				default:
					current_state <= IDLE;
			endcase
	end
	
	assign idle  = (current_state == IDLE);
	assign stall = (current_state != IDLE) || instruction_valid;
	
	
	
	// Assign MC0 for incrementing the address from AEG0.
	// ASSUME there will be no stalls. (This is not always a safe assumption!)
	assign mc_req_ld[0]        = (current_state == CAEP01_READ);
	assign mc_req_st[0]        = mc_rsp_push[0];         // Push from response port
	assign mc_req_size[0]      = 3;                      // 3 = 8 byte, 2 = 4 byte, 1 = 2 byte, 0 = 1 byte
	assign mc_req_vadr[0]      = aeg_registers[0][47:0]; // Virtual Address
	assign mc_req_wrd_rdctl[0] = mc_rsp_data[0] + 1;     // Data from response port
	assign mc_rsp_stall[0]     = 0;	                     // Not used
`ifdef MC_WR_CMP_IF
	assign mc_req_wrctl[0]     = 0;                      // Not used
	assign mc_wr_rsp_stall[0]  = 0;                      // Not used
`else
	assign mc_req_flush[0]     = 0;                      // Not used
`endif
	
	// More complex designs will use FIFOs on both ports of the MC (request and response ports).
	// The response port will connect the mc_rsp_stall to the almost full of a response FIFO.
	// The request port will connect the mc_rd_rq_stall || mc_wr_rq_stall to the pop request of the request FIFO.
	
	// In this example, we do not use memory controllers 1-15
	generate for (n=1; n<16; n=n+1)
	begin : mc_generate
		assign mc_req_ld[n]        = 0;
		assign mc_req_st[n]        = 0;
		assign mc_req_size[n]      = 0;
		assign mc_req_vadr[n]      = 0;
		assign mc_req_wrd_rdctl[n] = 0;
		assign mc_rsp_stall[n]     = 0;

`ifdef MC_WR_CMP_IF
		// Write complete interface
		assign mc_req_wrctl[n]     = 0;
		assign mc_wr_rsp_stall[n]  = 0;
`else
		// Write flush interface
		assign mc_req_flush[n]     = 0;
`endif
	end endgenerate
	
endmodule
