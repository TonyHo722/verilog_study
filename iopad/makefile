.PHONY: sim clean w wave
sim:
	xvlog -sv -i ../ tb_test.v \
	    	-f ./env/bfm.lib.f \
		-f filelist 
	xelab tb_test -debug typical --snapshot tb_test_xelab --timescale 1ns/1ns
	xsim tb_test_xelab --tclbatch log_wave.tcl
wave: w

w: 
	vivado -source open_wave.tcl &

clean:
	- rm vivado*.log vivado*.jou
	- rm xsim*.log xsim*.jou *.str
	- rm xvlog.* xelab.*
	- rm -rf xsim.dir
	- rm -rf .Xil

#!/bin/bash

# gtkwave top_bench.vcd &


