`include "basics.v"

module t_half_adder;
	wire t_S, t_C;
	reg [1: 0] t_in;

	half_adder HA1 (t_S, t_C, t_in[0], t_in[1]);

	initial #1000 $finish;

	initial begin
		t_in = 2'b0;
		#1 repeat (3) #1 t_in += 1;
	end

	initial begin
		$monitor(" S | C | xy ");
		repeat (3) #1 $monitor(" %b | %b | %b ", t_S, t_C, t_in);
	end
endmodule

