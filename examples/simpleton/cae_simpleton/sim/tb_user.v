`timescale 1 ns / 1 ps

module tb_user();

  initial begin
    // Insert user code here, such as signal dumping
    // set CNY_PDK_TB_USER_VLOG variable in makefile
    `include "PDK_SIM_CONFIG.vh"
    `ifdef AE0_PRESENT
        $wlfdumpvars(5,testbench.cae_fpga0.ae_top.core.cae_pers);
    `endif
    `ifdef AE1_PRESENT
        $wlfdumpvars(5,testbench.cae_fpga1.ae_top.core.cae_pers);
    `endif
    `ifdef AE2_PRESENT
        $wlfdumpvars(5,testbench.cae_fpga2.ae_top.core.cae_pers);
    `endif
    `ifdef AE3_PRESENT
        $wlfdumpvars(5,testbench.cae_fpga3.ae_top.core.cae_pers);
    `endif
  end

endmodule
