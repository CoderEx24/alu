`include "alu.v"

module t_logic_unit;
	wire O;
	reg [3: 0] in;
	
	logic_unit LU (O, in[3], in[2], in[1: 0]);

	initial #1000 $finish;

	initial begin
		in = 3'b0;
		#1 repeat (15) #1 in += 1;
	end

	initial begin
		$monitor(" -A- | -B- | --S-- | -O- ");
		repeat (15) #1 $monitor(" %b | %b | %b | %b ", in[3], in[2], in[1: 0], O);
	end

endmodule

