`include "basics.v"

module t_half_adder;
	wire t_S, t_C;
	reg [1: 0] t_in;

	half_adder HA1 (t_S, t_C, t_in[0], t_in[1]);

	initial #1000 $finish;

	initial begin
		$monitor(" S | C | xy ");
		t_in = 2'b00;
		repeat (4) #10 $monitor(" %b | %b | %b ", t_S, t_C, t_in);
		repeat (4) #10 t_in = t_in + 1;
	end
endmodule

