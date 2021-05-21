`timescale 10ns / 10ns

module TB_doubledebounce;

// Inputs
   reg reset;
   reg X0;
   reg X1;

// Output
   wire out0;
   wire out1;
   
//other regs
	reg clk_50;

// Instantiate the design to be tested
   doubledebounce UUT(   //NOTE: the instance name ('mx' here) can be anything you like 
		.X0(X0), 
		.X1(X1), 
		.reset(reset), 
		.X0_deb(out0),
		.X1_deb(out1),
		.sysclk(clk_50)
   );

//create clock at 50MHz
initial begin
clk_50=0;
forever 
#1 clk_50 = ~clk_50; // every ten nanoseconds invert
end



// Signal changes
initial begin
		reset=0;
		X0=0;
		X1=0;
		
		#1 reset = 1'b1;
		#30 reset = 1'b0;
		
		#20 X0= 1'b1;
		
		#30000000 X0 = 1'b0;
		
		#1000 X1 = 1'b1;
		#30000000 X1 = 1'b0;
		
		#10000 X0 = 1'b1;
		#500 X1 = 1'b1;
				
		#20000000 X1 = 1'b0; X0=1'b0;
				
		#1; $finish;  // terminates simulation
end

endmodule
