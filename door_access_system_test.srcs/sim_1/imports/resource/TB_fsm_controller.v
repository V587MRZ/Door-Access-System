`timescale 10ns / 1ns

module TB_fsm_controller;

// Inputs
reg ready;
reg done;
reg closed;
reg found;
reg reset_btn;

// Output
wire start;
wire reset;
wire acc_gran;

   
//others 
reg clk_50;

// Instantiate the design to be tested
fsm_controller UUT( 
	.sysclk(clk_50),
	.ready(ready),
	.done(done),
	.closed(closed),
	.found(found),
	.reset_btn(reset_btn),
	.start(start),
	.reset(reset),
	.acc_gran(acc_gran));
   
initial begin
clk_50=1'b0;
forever
#1 clk_50 = ~clk_50; // every ten nanoseconds invert
end

initial begin
	ready=1'b0;
	done=1'b0;
	closed=1'b0;
	found=1'b0;
	reset_btn=1'b0;
end

// Signal changes
initial begin
		#10 reset_btn=1'b1;
		#20 reset_btn=1'b0;
		
		#50 ready=1'b1;
		#4 ready=1'b0;
		#50 done=1'b1; 
		#4 done=1'b0;
		
		#50 ready=1'b1;
		#4 ready=1'b0;
		#50 done=1'b1; found=1'b1;
		#4 done=1'b0; found=1'b0;
		#30 closed=1'b1;
		#2 closed=1'b0;
		
		#50; $finish;  // terminates simulation
end

endmodule