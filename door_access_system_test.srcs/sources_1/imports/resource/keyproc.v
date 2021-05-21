module keyproc(input wire X0,
input wire X1,
input wire reset,
input wire sysclk,
output wire ready,
output reg [3:0] count,
output reg [7:0] pin_no);

always @(posedge sysclk) begin
	if (reset) begin
		count<=4'b0000;
		pin_no<=8'h00;
	end
	else if ((X0||X1)&&(~ready)) begin
		 if (X0) 
			pin_no<={pin_no[6:0], 1'b0}; //this syntax implements a shift register
		 else 				      //make sure you understand it
			pin_no<={pin_no[6:0], 1'b1}; //拼接，把前7位与0或1拼接
			
		 count<=count+4'd1; 
	end
end

assign ready=count[3];
endmodule

