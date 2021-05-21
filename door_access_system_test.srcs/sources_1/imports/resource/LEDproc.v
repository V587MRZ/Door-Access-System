module LEDproc(
input wire [3:0] count,
input wire acc_grant,//open the door
output reg [7:0] LEDs);

always @(*)begin			
// you will need to write something in here
    if (acc_grant == 1) LEDs = 8'b0101_0101;
    else begin
    case (count)
        4'd1: LEDs = 8'b0000_0001;
        4'd2: LEDs = 8'b0000_0011;
        4'd3: LEDs = 8'b0000_0111;
        4'd4: LEDs = 8'b0000_1111;
        4'd5: LEDs = 8'b0001_1111;
        4'd6: LEDs = 8'b0011_1111;
        4'd7: LEDs = 8'b0111_1111;
        4'd8: LEDs = 8'b1111_1111;
        default: LEDs = 8'b0000_0000; 
    endcase
    end
end

endmodule

