module doorshut(
input wire reset,
input wire closed_sw,
input wire sysclk,
output wire closed_fsm);

wire pulse, ff_and;
// heartbeat generator instantiation
heartbeat #(16) hb(.sysclk(sysclk),.reset(reset),.pulse(pulse)); 

reg ff_deb[2:0];
reg ffout;

always @(posedge sysclk) begin
	if(pulse) begin
		ff_deb[0]<=closed_sw; //synchroniser ff chain
		ff_deb[1]<=ff_deb[0];
		ff_deb[2]<=ff_deb[1];
	end

	ffout<=ff_and; //ffout is the ff for single pulse on transition
end

assign ff_and=ff_deb[2]&ff_deb[1]&ff_deb[0];
assign closed_fsm=ff_and&(~ffout);

endmodule


