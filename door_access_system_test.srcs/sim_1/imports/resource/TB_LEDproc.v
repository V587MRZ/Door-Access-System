`timescale 10ns / 1ns

module TB_LEDproc;

// Inputs
   reg [3:0] count;
   reg acc_grant;

// Output
   wire [7:0] LEDs;
   
//other regs

// Instantiate the design to be tested
   LEDproc UUT( 
		.count(count), 
		.acc_grant(acc_grant), 
		.LEDs(LEDs)
   );

initial begin
	count=3'd0;
	acc_grant=1'b0;
end

// Signal changes
initial begin
		
		#4 count= 4'd1;
		#2 count= 4'd2;
		#2 count= 4'd3;
		#2 count= 4'd4;
		#2 count= 4'd5;
		#2 count= 4'd6;
		#2 count= 4'd7;
		#2 count = 4'd8;
		
		#8 acc_grant= 1'b1;
		
		#4 count= 3'd0;
		#4 acc_grant= 1'b0;
		
		#4; $finish;  // terminates simulation
end

endmodule