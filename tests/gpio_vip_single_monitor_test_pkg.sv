package gpio_vip_single_monitor_test_pkg;

	`include "uvm_macros.svh"

	import uvm_pkg::*;
	import gpio_vip_tests_env_pkg::*;
	import gpio_vip_single_base_test_pkg::*;

	class gpio_vip_single_monitor_test extends gpio_vip_single_base_test;

		`uvm_component_utils(gpio_vip_single_monitor_test)

		function new(string name = "gpio_vip_single_monitor_test", uvm_component parent = null);
			super.new(name, parent);
		endfunction // new

		virtual task run_phase(uvm_phase phase);
			automatic bit [WIDTH-1:0] rand_val;

			phase.raise_objection(phase);

			gpio_vif.gpio_out_enable = {WIDTH{1'b1}};
			repeat(10000) begin
				if(!std::randomize(rand_val)) begin
					`uvm_error("GPIO_VIP_SINGLE_MONITOR_TEST", "Randomization Failed")
				end
				gpio_vif.gpio_out_data = rand_val;
				#1;
			end

			phase.drop_objection(phase);
		endtask // run_phase

	endclass

endpackage // gpio_vip_single_monitor_test_pkg
