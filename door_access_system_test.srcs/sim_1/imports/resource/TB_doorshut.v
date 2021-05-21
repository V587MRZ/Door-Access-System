`timescale 10ns / 10ns

module TB_doorshut;

// Inputs
   reg closed_sw;
	reg reset;

// Output
   wire closed_fsm;
   
//others 
reg clk_50;

// Instantiate the design to be tested
doorshut UUT( 
	.reset(reset),
	.closed_sw(closed_sw), 
	.sysclk(clk_50),
	.closed_fsm(closed_fsm)
);
   
initial begin
	clk_50=1'b0;
	forever #1 clk_50 = ~clk_50; // every ten nanoseconds invert
end

initial begin //initial signal values
	closed_sw=1'b1;
	reset=1'b1;
end

// Signal changes
initial begin	
		#50 reset=1'b0;
		#1000000 closed_sw=1'b0;
		#1000000 closed_sw=1'b1;
		#1000000 closed_sw=1'b0;
		#1000000 closed_sw=1'b1;
		
		#100 $finish;  // terminates simulation
end

endmodule