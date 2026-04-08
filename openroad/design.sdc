current_design ALU64

# Virtual clock (for combinational design)
create_clock -name clk -period 10

# Input delays
set_input_delay 2 -clock clk [all_inputs]

# Output delays
set_output_delay 2 -clock clk [all_outputs]

# Output load
set_load 0.03 [all_outputs]
