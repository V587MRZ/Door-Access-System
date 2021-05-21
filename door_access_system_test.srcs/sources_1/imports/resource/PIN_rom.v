module PIN_rom (input wire [3:0] addr,
output reg [7:0] data);

always @(*) begin
case (addr)
	4'h0: data = 8'b00100000;// 16 valid PIN codes
	4'h1: data = 8'b00000010;
	4'h2: data = 8'b00000100;
	4'h3: data = 8'b00001000;
	4'h4: data = 8'b00010000;
	4'h5: data = 8'b01111100;
	4'h6: data = 8'b01000000;
	4'h7: data = 8'b10000000;
	4'h8: data = 8'b10000001;
	4'h9: data = 8'b10000010;
	4'ha: data = 8'b10000100;
	4'hb: data = 8'b10001000;
	4'hc: data = 8'b10010000;
	4'hd: data = 8'b10100000;
	4'he: data = 8'b11000000;
	4'hf: data = 8'b00000001;
	default: data = 8'b00000000;    //should not occur
endcase
end 
endmodule 

