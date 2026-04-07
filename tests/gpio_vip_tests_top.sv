module gpio_vip_tests_top;

	initial begin
		uvm_pkg::run_test();
	end

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars;
	end

endmodule // gpio_vip_tests_top
