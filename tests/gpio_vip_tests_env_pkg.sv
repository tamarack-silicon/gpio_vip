package gpio_vip_tests_env_pkg;

	`include "uvm_macros.svh"

	import uvm_pkg::*;
	import tamarack_gpio_agent_pkg::*;

	localparam integer WIDTH = `CFG_WIDTH;

	class gpio_vip_single_tests_env extends uvm_env;

		`uvm_component_utils(gpio_vip_single_tests_env)

		tamarack_gpio_agent#(.WIDTH(WIDTH)) m_gpio_agent_a;

		function new(string name = "gpio_vip_single_tests_env", uvm_component parent = null);
			super.new(name, parent);
		endfunction // new

		virtual function void build_phase(uvm_phase phase);
			super.build_phase(phase);

			m_gpio_agent_a = tamarack_gpio_agent#(.WIDTH(WIDTH))::type_id::create("m_gpio_agent_a", this);
		endfunction // build_phase

		virtual function void connect_phase(uvm_phase phase);
			super.connect_phase(phase);
		endfunction // connect_phase

	endclass // gpio_vip_single_tests_env

	class gpio_vip_dual_tests_env extends uvm_env;

		`uvm_component_utils(gpio_vip_dual_tests_env)

		tamarack_gpio_agent#(.WIDTH(WIDTH)) m_gpio_agent_a;
		tamarack_gpio_agent#(.WIDTH(WIDTH)) m_gpio_agent_b;

		function new(string name = "gpio_vip_dual_tests_env", uvm_component parent = null);
			super.new(name, parent);
		endfunction // new

		virtual function void build_phase(uvm_phase phase);
			super.build_phase(phase);

			m_gpio_agent_a = tamarack_gpio_agent#(.WIDTH(WIDTH))::type_id::create("m_gpio_agent_a", this);
			m_gpio_agent_b = tamarack_gpio_agent#(.WIDTH(WIDTH))::type_id::create("m_gpio_agent_b", this);
		endfunction // build_phase

		virtual function void connect_phase(uvm_phase phase);
			super.connect_phase(phase);
		endfunction // connect_phase

	endclass // gpio_vip_dual_tests_env

endpackage
