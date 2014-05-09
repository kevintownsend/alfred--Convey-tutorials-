# Makefile $Header: /cvs/cae_vadd/sim/Makefile,v 1.17 2011/11/15 20:01:45 gedwards Exp $

# To fix the seed for simulation:
# CNY_PDK_SIM_SEED = 11223344

# MC_XBAR variable is set in ../Makefile.include
USER_SWMODEL_CFLAGS += -DMC_XBAR=$(MC_XBAR)
$(CNY_PDK_SWMODEL_EXE): ../Makefile.include

# Use one of the following two options for waveform viewing:
# Option #1: Run the modelsim simulator in interactive mode.  Type "run -all" after loading wave file
# USER_SIM_OPTIONS = -gui
# Option #2: Output waveform to file (vsim.wlf) for later viewing (vsim ../sim/vsim.wlf)
CNY_PDK_TB_USER_VLOG += ./tb_user.v

####################################################################
# Include Convey Makefile Template
####################################################################
include ../Makefile.include
