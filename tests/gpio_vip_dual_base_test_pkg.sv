package gpio_vip_dual_base_test_pkg;

	`include "uvm_macros.svh"

	import uvm_pkg::*;
	import gpio_vip_tests_env_pkg::*;

	class gpio_vip_dual_base_test extends uvm_test;

		`uvm_component_utils(gpio_vip_dual_base_test)

		gpio_vip_dual_tests_env m_env;

		function new(string name = "gpio_vip_dual_base_test", uvm_component parent = null);
			super.new(name, parent);
		endfunction // new

		virtual function void build_phase(uvm_phase phase);
			super.build_phase(phase);

			m_env = gpio_vip_dual_tests_env::type_id::create("m_env", this);
		endfunction // build_phase

		virtual task run_phase(uvm_phase phase);
			phase.raise_objection(phase);

			phase.drop_objection(phase);
		endtask // run_phase

	endclass // gpio_vip_dual_base_test

endpackage // gpio_vip_dual_base_test_pkg
