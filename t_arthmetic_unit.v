`include "alu.v"

module t_arthmetic_unit;
	reg  [10: 0] in;
	wire [3 : 0] result;
	wire C_out;

	arthmetic_unit AU (result, C_out, in[10: 7], in[6: 3], in[2: 1], in[0]);

	initial #10000 $finish;

	initial begin
		in = 10'b0;
		#1 repeat (2047) #1 in += 1;
	end

	initial begin
		$monitor(" --A-- | --B-- | --S-- | -C in - | -R- | C | ");
		repeat (2047) 
			#1 $monitor("  %b |  %b | %b    | %b       | %b | %b ", 
				in[10: 7], in[6: 3], in[2: 1], in[0], result, C_out);
	end
endmodule
