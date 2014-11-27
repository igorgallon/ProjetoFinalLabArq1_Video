vlib work
vmap work work
vcom -work work *.vhdl
vcom -work work *.vhd
vsim work.t_processor
add wave -radix hexadecimal sim:/t_processor/the_processor/clock
add wave sim:/t_processor/the_processor/state_machine/next_state

add wave -group fetch -radix hexadecimal /t_processor/the_processor/enable_program_counter
add wave -group fetch -radix hexadecimal /t_processor/the_processor/instruction_address
add wave -group fetch -radix hexadecimal /t_processor/the_processor/current_instruction
add wave -group fetch sim:/t_processor/the_processor/state_machine/opcode
add wave -group fetch -radix hexadecimal sim:/t_processor/the_processor/register1
add wave -group fetch -radix hexadecimal sim:/t_processor/the_processor/register2
add wave -group fetch -radix hexadecimal sim:/t_processor/the_processor/register3
add wave -group fetch -radix hexadecimal sim:/t_processor/the_processor/offset
add wave -group fetch -radix hexadecimal sim:/t_processor/the_processor/jump_offset

add wave -group decode -radix hexadecimal sim:/t_processor/the_processor/alu_operation
add wave -group decode -radix hexadecimal sim:/t_processor/the_processor/register_a
add wave -group decode -radix hexadecimal sim:/t_processor/the_processor/register_b
add wave -group decode -radix hexadecimal sim:/t_processor/the_processor/offset
add wave -group decode -radix hexadecimal sim:/t_processor/the_processor/alu_operand1
add wave -group decode -radix hexadecimal sim:/t_processor/the_processor/alu_operand2
add wave -group decode -radix hexadecimal sim:/t_processor/the_processor/alu_result

add wave -group alu -radix hexadecimal sim:/t_processor/the_processor/enable_alu_output_register
add wave -group alu -radix hexadecimal sim:/t_processor/the_processor/source_alu
add wave -group alu -radix hexadecimal sim:/t_processor/the_processor/data_from_alu_output_register

add wave -group mem -radix hexadecimal sim:/t_processor/the_processor/read_memory
add wave -group mem -radix hexadecimal sim:/t_processor/the_processor/write_memory
add wave -group mem -radix hexadecimal sim:/t_processor/the_processor/write_register
add wave -group mem -radix hexadecimal sim:/t_processor/the_processor/address_to_read
add wave -group mem -radix hexadecimal sim:/t_processor/the_processor/address_to_write
add wave -group mem -radix hexadecimal sim:/t_processor/the_processor/data_from_memory
add wave -group mem -radix hexadecimal sim:/t_processor/the_processor/jump_control

add wave -group writeback -radix hexadecimal sim:/t_processor/the_processor/write_register
add wave -group writeback -radix hexadecimal sim:/t_processor/the_processor/mem_to_register
add wave -group writeback -radix hexadecimal sim:/t_processor/the_processor/reg_dst
add wave -group writeback -radix hexadecimal sim:/t_processor/the_processor/destination_register
add wave -group writeback -radix hexadecimal sim:/t_processor/the_processor/data_to_write_in_register

add wave -group video sim:/t_processor/video_card/row
add wave -group video sim:/t_processor/video_card/column
add wave -group video -radix hexadecimal sim:/t_processor/video_address
add wave -group video -radix hexadecimal sim:/t_processor/video_out
add wave -group video -radix hexadecimal sim:/t_processor/pixel
add wave -group video -radix hexadecimal sim:/t_processor/video_card/disp_ena
add wave -group video -radix hexadecimal sim:/t_processor/video_card/h_sync
add wave -group video -radix hexadecimal sim:/t_processor/video_card/v_sync
add wave -group video -radix hexadecimal sim:/t_processor/VGA_R
add wave -group video -radix hexadecimal sim:/t_processor/VGA_G
add wave -group video -radix hexadecimal sim:/t_processor/VGA_B
add wave -group video sim:/t_processor/VGA_HS_d
add wave -group video sim:/t_processor/VGA_VS_d
add wave -group video sim:/t_processor/disp_ena_d

add wave -group relatorio -radix hexadecimal sim:/t_processor/the_processor/branch_control
add wave -group relatorio -radix hexadecimal sim:/t_processor/the_processor/zero_flag
add wave -group relatorio -radix hexadecimal sim:/t_processor/the_processor/beq_control
add wave -group relatorio -radix hexadecimal sim:/t_processor/the_processor/bne_control
add wave -group relatorio -radix hexadecimal sim:/t_processor/the_processor/instruction_address

WaveRestoreCursors {{bne t0,t1,1 F} {124385 ps} 1} {{bne t2,t0,7 T} {205154 ps} 1} {{beq t2,t0,1 F} {235000 ps} 1} {{beq t0,t1,12 T} {355359 ps} 1} {{bne to,t2,7 F} {464572 ps} 1} {{Cursor 6} {59319 ps} 0}

configure wave -shortnames 1

run 500 ns

wave zoom full