`include "./basics.v"

module arthmetic_unit(
	output [3: 0] R,
	output C_out,
	input [3: 0] A, B,
	input [1: 0] S,
	input C_in
);
	wire [3: 0] D;
	wire C1, C2, C3;

	mux_4x1 MUX1 (D[0], B[0], !B[0], 1'b0, 1'b1, S),
		MUX2 (D[1], B[1], !B[1], 1'b0, 1'b1, S),
	 	MUX3 (D[2], B[2], !B[2], 1'b0, 1'b1, S),
	 	MUX4 (D[3], B[3], !B[3], 1'b0, 1'b1, S);

	full_adder FA1 (R[0], C1,    A[0], D[0], C_in),
		   FA2 (R[1], C2,    A[1], D[1],   C1),
		   FA3 (R[2], C3,    A[2], D[2],   C2),
	 	   FA4 (R[3], C_out, A[3], D[3],   C3);

endmodule

module logic_unit(
	output O,
	input A, B,
	input [1: 0] S
);

	mux_4x1 MUX (O, A & B, A | B, A ^ B, ~A, S);

endmodule

module shift_unit(
	output [3: 0] H,
	input  [3: 0] A,
	input right, left,
	input S
);
	mux_2x1 MUX1 (H[0], right, A[1], S),
		MUX2 (H[1], A[0],  A[2], S),
		MUX3 (H[2], A[1],  A[3], S),
		MUX4 (H[3], A[2],  left, S);

endmodule

