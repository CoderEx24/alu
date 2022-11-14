`include "alu.v"

module t_logic_unit;
	wire O;
	reg [3: 0] in;
	
	logic_unit LU (O, in[3], in[2], in[1: 0]);

	initial #1000 $finish;

	initial begin
		$monitor(" -A- | -B- | --S-- | -O- ");
		#10 in = 4'b0;
		repeat (15) #10 $monitor(" %b | %b | %b | %b ", in[3], in[2], in[1: 0], O);
		repeat (15) #10 in += 1;
	end

endmodule

