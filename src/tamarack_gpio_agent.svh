`ifndef TAMARACK_GPIO_AGENT_SVH
`define TAMARACK_GPIO_AGENT_SVH

class tamarack_gpio_agent #(parameter integer WIDTH = 32) extends uvm_agent;

	`uvm_component_param_utils(tamarack_gpio_agent#(.WIDTH(WIDTH)))

	tamarack_gpio_driver#(.WIDTH(WIDTH)) driver;
	tamarack_gpio_monitor#(.WIDTH(WIDTH)) monitor;
	uvm_sequencer#(tamarack_gpio_item#(.WIDTH(WIDTH))) sequencer;

	function new(string name = "tamarack_gpio_agent", uvm_component parent = null);
		super.new(name, parent);
	endfunction // new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		`uvm_info("TAMARACK_GPIO_AGENT", $sformatf("Tamarack Silicon Project GPIO Agent %s , is_active = %s , WIDTH = %0d", get_full_name(), get_is_active().name(), WIDTH), UVM_HIGH)

		if(get_is_active() == UVM_ACTIVE) begin
			sequencer = uvm_sequencer#(tamarack_gpio_item#(.WIDTH(WIDTH)))::type_id::create("gpio_sequencer", this);
			driver = tamarack_gpio_driver#(.WIDTH(WIDTH))::type_id::create("gpio_driver", this);
		end

		monitor = tamarack_gpio_monitor#(.WIDTH(WIDTH))::type_id::create("gpio_monitor", this);
	endfunction // build_phase

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		if(get_is_active() == UVM_ACTIVE) begin
			driver.seq_item_port.connect(sequencer.seq_item_export);
		end
	endfunction // connect_phase
	
endclass // tamarack_gpio_agent

`endif //  `ifndef TAMARACK_GPIO_AGENT_SVH
