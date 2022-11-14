`include "basics.v"

module t_mux_4x1;
	wire O;
	reg [5: 0] data; 
	
	mux_4x1 M1 (O, data[2], data[3], data[4], data[5], data[1: 0]);	

	initial #100000 $finish;

	initial begin
		data = 6'b000000;
		#1 $monitor("-------Input-------|---Selector---|-O-");
		repeat (63) #1 $monitor("%b | %b | %b", data[5: 2], data[1: 0], O);
		repeat (63) #1 data = data + 1;
	end

endmodule

