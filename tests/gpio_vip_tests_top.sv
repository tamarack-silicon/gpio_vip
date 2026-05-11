`ifndef CFG_WIDTH
	`define CFG_WIDTH 32
`endif

module gpio_vip_tests_top;

	localparam integer WIDTH = `CFG_WIDTH;

	wire [WIDTH-1:0]   bus;

	tamarack_gpio_if#(.WIDTH(WIDTH)) gpio_if_a();
	tamarack_gpio_if#(.WIDTH(WIDTH)) gpio_if_b();

	generate
		for(genvar i = 0; i < WIDTH; i++) begin : tri_state_buf_gen
			assign bus[i] = gpio_if_a.gpio_out_enable[i] ? gpio_if_a.gpio_out_data[i] : 1'bz;
			assign gpio_if_a.gpio_in_data[i] = bus[i];
			assign bus[i] = gpio_if_b.gpio_out_enable[i] ? gpio_if_b.gpio_out_data[i] : 1'bz;
			assign gpio_if_b.gpio_in_data[i] = bus[i];
		end
	endgenerate

	initial begin
		uvm_pkg::uvm_config_db#(virtual tamarack_gpio_if#(.WIDTH(WIDTH)))::set(null, "uvm_test_top.m_env.m_gpio_agent_a", "gpio_vif", gpio_if_a);
		uvm_pkg::uvm_config_db#(virtual tamarack_gpio_if#(.WIDTH(WIDTH)))::set(null, "uvm_test_top.m_env.m_gpio_agent_b", "gpio_vif", gpio_if_b);
		uvm_pkg::run_test();
	end

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars;
	end

endmodule // gpio_vip_tests_top
