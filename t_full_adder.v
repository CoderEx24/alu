`include "./basics.v"

module t_full_adder;
	reg [2: 0] in;
	wire S, C;

	full_adder FA (S, C, in[0], in[1], in[2]);

	initial #1000 $finish;

	initial begin
		in = 3'b0;
		#1 repeat (7) #1 in += 1;
	end

	initial begin
		$monitor(" xyz | S | C ");
		repeat (7) #1 $monitor(" %b | %b | %b ", in, S, C);

	end

endmodule
