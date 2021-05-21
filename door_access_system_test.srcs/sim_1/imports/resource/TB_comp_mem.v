`timescale 10ns / 1ns

module TB_comp_mem;

// Inputs
   reg start;
   reg [7:0] pin_no;
   reg reset;

// Output
   wire done;
   wire found;
   
//others 
wire [7:0] memdata;
wire [3:0] memaddr;
reg clk_50;

// Instantiate the design to be tested
pincomp UUT1( 
	.start(start), 
	.pin_no(pin_no), 
	.data(memdata), 
	.addr(memaddr),
	.done(done),
	.found(found),
	.sysclk(clk_50),
	.reset(reset)
);
   
 PIN_rom UUT2( 
	.addr(memaddr), 
	.data(memdata) 
);

   

initial begin
	clk_50=1'b0;
forever
	#1 clk_50 = ~clk_50; // every ten nanoseconds invert
end

initial begin //initial signal values
	pin_no=8'b10010000;
	start=1'b0;
	reset=1'b1;
end

// Signal changes
initial begin
		#4 reset=1'b0;
		#4 start= 1'b1;
	
		#40; $finish;  // terminates simulation
end

endmodule