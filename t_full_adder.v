`include "./basics.v"

module t_full_adder;
	reg [2: 0] in;
	wire S, C;

	full_adder FA (S, C, in[0], in[1], in[2]);

	initial #1000 $finish;

	initial begin
		$monitor(" xyz | S | C ");
		#10 in = 3'b000;
		repeat (8) #10 $monitor(" %b | %b | %b ", in, S, C);
		repeat (8) #10 in += 1;

	end

endmodule
