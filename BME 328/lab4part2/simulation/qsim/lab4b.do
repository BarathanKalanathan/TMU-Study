onerror {quit -f}
vlib work
vlog -work work lab4b.vo
vlog -work work lab4b.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lab4b_vlg_vec_tst
vcd file -direction lab4b.msim.vcd
vcd add -internal lab4b_vlg_vec_tst/*
vcd add -internal lab4b_vlg_vec_tst/i1/*
add wave /*
run -all
