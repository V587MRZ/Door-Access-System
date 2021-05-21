module dooraccess(input wire btn_X0, 
input wire sysclk,
input wire btn_X1,
input wire btn_reset,
input wire closed_sw,
output wire [7:0] LEDs);

wire ready, done, closed, found, start, fsm_reset, acc_gran;
wire X0_deb, X1_deb;
wire [3:0] count;
wire [7:0] pin_no;

wire [3:0] rom_addr;
wire [7:0] rom_data;


fsm_controller fsm(
	.sysclk(sysclk),
	.ready(ready),
	.done(done),
	.closed(closed),
	.found(found),
	.reset_btn(btn_reset),
	.start(start),
	.reset(fsm_reset),
	.acc_gran(acc_gran));
	
doorshut door(
	.reset(btn_reset),
	.closed_sw(closed_sw),
	.sysclk(sysclk),
	.closed_fsm(closed));
	
doubledebounce ddb(
.X0(btn_X0),
.X1(btn_X1),
.sysclk(sysclk),
.reset(fsm_reset),
.X0_deb(X0_deb),
.X1_deb(X1_deb)		//X0 represents the input for the "0" key, X1 for the "1" key
);

keyproc key(
.X0(X0_deb),
.X1(X1_deb),
.reset(fsm_reset),
.sysclk(sysclk),
.ready(ready),
.count(count),
.pin_no(pin_no));

LEDproc led(
.count(count),
.acc_grant(acc_gran),
.LEDs(LEDs));

PIN_rom pinrom(.addr(rom_addr),
.data(rom_data));

pincomp comparator(
.start(start),
.pin_no(pin_no),
.data(rom_data),
.sysclk(sysclk),
.reset(fsm_reset),
.addr(rom_addr),
.done(done),
.found(found));

endmodule
	
	