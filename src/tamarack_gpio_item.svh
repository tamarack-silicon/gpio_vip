`ifndef TAMARACK_GPIO_ITEM_SVH
`define TAMARACK_GPIO_ITEM_SVH

class tamarack_gpio_item #(parameter integer WIDTH = 32) extends uvm_sequence_item;

	function new(string name = "tamarack_gpio_item");
		super.new(name);
	endfunction // new

	bit [WIDTH-1:0]      gpio_in_data;
	rand bit [WIDTH-1:0] gpio_out_data;
	rand bit [WIDTH-1:0] gpio_out_enable;

	`uvm_object_param_utils_begin(tamarack_gpio_item#(.WIDTH(WIDTH)))
		`uvm_field_int(gpio_in_data, UVM_DEFAULT)
		`uvm_field_int(gpio_out_data, UVM_DEFAULT)
		`uvm_field_int(gpio_out_enable, UVM_DEFAULT)
	`uvm_object_utils_end

endclass // tamarack_gpio_item

`endif //  `ifndef TAMARACK_GPIO_ITEM_SVH
