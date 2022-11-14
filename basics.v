module mux_4x1(output O, 
	input i1, i2, i3, i4,
	input [1: 0] S
);
	assign O = (i1 && !S[0]  && !S[1]) ||
		   (i2 &&  S[0]  && !S[1]) ||
		   (i3 && !S[0]  &&  S[1]) ||
		   (i4 &&  S[0]  &&  S[1]);

endmodule

module half_adder(output S, C, input x, y);
	xor (S, x, y);
	and (C, x, y);

endmodule

module full_adder(output S, C, input x, y, z);
	wire tmp, c1, c2;

	half_adder HA1 (tmp, c1, x, y);
	half_adder HA2 (S, c2, tmp, z);
	
	or (C, c1, c2);

endmodule

