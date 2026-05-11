package gpio_vip_dual_simple_driver_test_pkg;

	`include "uvm_macros.svh"

	import uvm_pkg::*;
	import tamarack_gpio_agent_pkg::*;
	import gpio_vip_tests_env_pkg::*;
	import gpio_vip_dual_base_test_pkg::*;

	class gpio_vip_dual_simple_driver_test_seq extends uvm_sequence#(tamarack_gpio_item#(.WIDTH(WIDTH)));

		`uvm_object_utils(gpio_vip_dual_simple_driver_test_seq)

		function new(string name = "gpio_vip_dual_simple_driver_test_seq");
			super.new(name);
		endfunction // new

		virtual task body();
			tamarack_gpio_item#(.WIDTH(WIDTH)) m_item;

			repeat(10000) begin
				m_item = tamarack_gpio_item#(.WIDTH(WIDTH))::type_id::create("m_item");

				start_item(m_item);

				if(!m_item.randomize()) begin
					`uvm_error("GPIO_VIP_DUAL_SIMPLE_DRIVER_TEST", "Randomization Failed")
				end

				finish_item(m_item);

				#1;
			end
		endtask // body

	endclass

	class gpio_vip_dual_simple_driver_test extends gpio_vip_dual_base_test;

		`uvm_component_utils(gpio_vip_dual_simple_driver_test)

		function new(string name = "gpio_vip_dual_simple_driver_test", uvm_component parent = null);
			super.new(name, parent);
		endfunction // new

		virtual task run_phase(uvm_phase phase);
			gpio_vip_dual_simple_driver_test_seq m_seq;
			m_seq = gpio_vip_dual_simple_driver_test_seq::type_id::create("m_seq");

			phase.raise_objection(phase);

			m_seq.start(m_env.m_gpio_agent_a.sequencer);

			phase.drop_objection(phase);
		endtask // run_phase

	endclass

endpackage // gpio_vip_dual_simple_driver_test_pkg
