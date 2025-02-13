onerror {quit -f}
vlib work
vlog -work work lab_7.vo
vlog -work work lab_7.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lab_7_vlg_vec_tst
vcd file -direction lab_7.msim.vcd
vcd add -internal lab_7_vlg_vec_tst/*
vcd add -internal lab_7_vlg_vec_tst/i1/*
add wave /*
run -all
