`timescale 10ns / 10ns

module TB_keyproc;

// Inputs
   reg reset;
   reg X0;
   reg X1;

// Output
   wire ready;
   wire out1;
   wire [3:0] count;
   wire [7:0] PIN;
   
//other regs
reg clk_50;

// Instantiate the design to be tested
   keyproc UUT( 
		.X0(X0), 
		.X1(X1), 
		.reset(reset), 
		.ready(ready),
		.count(count),
		.pin_no(PIN),
		.sysclk(clk_50)
   );

//create clock at 50MHz
initial begin
clk_50=0;
forever 
#1 clk_50 = ~clk_50; // every ten nanoseconds invert
end

initial begin // initialisation of signals
X0=0;
X1=0;
reset=0;
end

// Signal changes note it is 2 steps to a clock cycle
initial begin

		#1 reset = 1'b1;
		#10 reset = 1'b0;
		
		#4 X1= 1'b1;
		#2 X1= 1'b0;
		
		#4 X0= 1'b1;
		#2 X0= 1'b0;
		
		#4 X1= 1'b1;
		#2 X1= 1'b0;
		
		#4 X1= 1'b1;
		#2 X1= 1'b0;
		
		#4 X0= 1'b1;
		#2 X0= 1'b0;
		
		#4 X0= 1'b1;
		#2 X0= 1'b0;
		
		#4 X0= 1'b1;
		#2 X0= 1'b0;
		
		#4 X1= 1'b1;
		#2 X1= 1'b0;
		
		#10 X1= 1'b1;
		#2 X1= 1'b0;
		
		#10; $finish;  // terminates simulation
end

endmodule