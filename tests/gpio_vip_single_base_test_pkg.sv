package gpio_vip_single_base_test_pkg;

	`include "uvm_macros.svh"

	import uvm_pkg::*;
	import gpio_vip_tests_env_pkg::*;

	class gpio_vip_single_base_test extends uvm_test;

		`uvm_component_utils(gpio_vip_single_base_test)

		gpio_vip_single_tests_env m_env;

		virtual tamarack_gpio_if#(.WIDTH(WIDTH)) gpio_vif;

		function new(string name = "gpio_vip_single_base_test", uvm_component parent = null);
			super.new(name, parent);
		endfunction // new

		virtual function void build_phase(uvm_phase phase);
			super.build_phase(phase);

			m_env = gpio_vip_single_tests_env::type_id::create("m_env", this);

			if(!uvm_config_db#(virtual tamarack_gpio_if#(.WIDTH(WIDTH)))::get(null, "uvm_test_top.m_env.m_gpio_agent_b", "gpio_vif", gpio_vif)) begin
				`uvm_fatal("GPIO_VIP_SINGLE_BASE_TEST", "Could not get virtual interface from config_db")
			end
		endfunction // build_phase

		virtual function void end_of_elaboration_phase(uvm_phase phase);
			super.end_of_elaboration_phase(phase);

			`uvm_info("GPIO_VIP_SINGLE_BASE_TEST", "Test topology:", UVM_HIGH)
			this.print();
		endfunction // end_of_elaboration_phase

		virtual task run_phase(uvm_phase phase);
			phase.raise_objection(phase);

			phase.drop_objection(phase);
		endtask // run_phase

	endclass

endpackage // gpio_vip_single_base_test_pkg
