`ifndef TAMARACK_GPIO_MONITOR_SVH
`define TAMARACK_GPIO_MONITOR_SVH

class tamarack_gpio_monitor #(parameter integer WIDTH = 32) extends uvm_monitor;

	`uvm_component_param_utils(tamarack_gpio_monitor#(.WIDTH(WIDTH)))

	function new(string name = "tamarack_gpio_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction // new

	uvm_analysis_port#(tamarack_gpio_item#(.WIDTH(WIDTH))) mon_analysis_port;
	virtual tamarack_gpio_if gpio_vif;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TAMARACK_GPIO_MONITOR", $sformatf("Tamarack Silicon Project GPIO Monitor %s , WIDTH = %0d", get_full_name(), WIDTH), UVM_HIGH)

`ifndef VERILATOR
		if(!uvm_config_db#(virtual tamarack_gpio_if#(.WIDTH(WIDTH)))::get(null, get_parent().get_full_name(), "gpio_vif", gpio_vif)) begin
`else
		if(!uvm_config_db#(virtual tamarack_gpio_if)::get(null, get_parent().get_full_name(), "gpio_vif", gpio_vif)) begin
`endif
			`uvm_fatal("TAMARACK_GPIO_MONITOR", "Could not get virtual interface from config_db")
		end

		mon_analysis_port = new("mon_analysis_port", this);
	endfunction // build_phase

	virtual task run_phase(uvm_phase phase);
		automatic tamarack_gpio_item#(.WIDTH(WIDTH)) m_item = tamarack_gpio_item#(.WIDTH(WIDTH))::type_id::create("gpio_item");

		super.run_phase(phase);

		forever begin

			@(m_item.gpio_in_data);
			m_item.gpio_out_enable = gpio_vif.gpio_out_enable;
			m_item.gpio_out_data = gpio_vif.gpio_out_data;
			m_item.gpio_in_data = gpio_vif.gpio_in_data;

			mon_analysis_port.write(m_item);

		end
	endtask // run_task

endclass // tamarack_gpio_monitor

`endif //  `ifndef TAMARACK_GPIO_MONITOR_SVH
