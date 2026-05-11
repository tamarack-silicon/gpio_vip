`ifndef TAMARACK_GPIO_DRIVER_SVH
`define TAMARACK_GPIO_DRIVER_SVH

class tamarack_gpio_driver #(parameter integer WIDTH = 32) extends uvm_driver#(tamarack_gpio_item#(.WIDTH(WIDTH)));

	`uvm_component_param_utils(tamarack_gpio_driver#(.WIDTH(WIDTH)))

	virtual tamarack_gpio_if#(.WIDTH(WIDTH)) gpio_vif;

	function new(string name = "tamarack_gpio_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction // new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TAMARACK_GPIO_DRIVER", $sformatf("Tamarack Silicon Project GPIO Driver %s , WIDTH = %0d", get_full_name(), WIDTH), UVM_HIGH)
		if(!uvm_config_db#(virtual tamarack_gpio_if#(.WIDTH(WIDTH)))::get(null, get_parent().get_full_name(), "gpio_vif", gpio_vif)) begin
			`uvm_fatal("TAMARACK_GPIO_DRIVER", "Could not get virtual interface from config_db")
		end
	endfunction // build_phase

	virtual task run_phase(uvm_phase phase);
		tamarack_gpio_item#(.WIDTH(WIDTH)) m_item;

		super.run_phase(phase);

		forever begin
			seq_item_port.get_next_item(m_item);
			`uvm_info("TAMARACK_GPIO_DRIVER", "Driving item:", UVM_HIGH)
			m_item.print();
			gpio_vif.gpio_out_data = m_item.gpio_out_data;
			gpio_vif.gpio_out_enable = m_item.gpio_out_enable;
			seq_item_port.item_done();
		end
	endtask // run_phase

endclass // tamarack_gpio_driver

`endif //  `ifndef TAMARACK_GPIO_DRIVER_SVH
