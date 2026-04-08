export DESIGN_NAME = ALU64
export PLATFORM    = nangate45

export VERILOG_FILES = designs/nandgate45/64bitALU/ALU64.v
export SDC_FILE      = designs/nandgate45/64bitALU/ALU64.sdc

export ABC_AREA = 1
export LEC_CHECK = 0

export CLOCK_PERIOD = 10

export PLACE_DENSITY = 0.30

export DIE_AREA = 0 0 800 800
export CORE_AREA = 100 100 700 700

export SYNTH_STRATEGY = "AREA 0"
