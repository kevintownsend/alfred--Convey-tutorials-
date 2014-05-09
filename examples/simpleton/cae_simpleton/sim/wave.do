onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/cae_fpga0/ae_top/core/cae_pers/leroy/current_state
add wave -noupdate /testbench/cae_fpga0/ae_top/core/cae_pers/leroy/clock
add wave -noupdate {/testbench/cae_fpga0/ae_top/core/cae_pers/leroy/mc_req_ld[0]}
add wave -noupdate {/testbench/cae_fpga0/ae_top/core/cae_pers/leroy/mc_req_st[0]}
add wave -noupdate -radix decimal {/testbench/cae_fpga0/ae_top/core/cae_pers/leroy/aeg_registers[0]}
add wave -noupdate /testbench/cae_fpga0/ae_top/core/cae_pers/leroy/aeg_read
add wave -noupdate /testbench/cae_fpga0/ae_top/core/cae_pers/leroy/aeg_write
add wave -noupdate -radix unsigned /testbench/cae_fpga0/ae_top/core/cae_pers/leroy/aeg_index
add wave -noupdate -radix unsigned /testbench/cae_fpga0/ae_top/core/cae_pers/leroy/aeg_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18705279 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 168
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {18825506 ps} {20425038 ps}
