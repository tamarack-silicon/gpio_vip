interface tamarack_gpio_if #(
	parameter integer WIDTH = 32
);

	logic [WIDTH-1:0] gpio_in_data;
	logic [WIDTH-1:0] gpio_out_data;
	logic [WIDTH-1:0] gpio_out_enable;

	modport internal (
		input gpio_in_data,
		output gpio_out_data, gpio_out_enable
	);

	modport external (
		input gpio_out_data, gpio_out_enable,
		output gpio_in_data
	);

endinterface // tamarack_gpio_if
