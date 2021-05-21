module pincomp(
input wire start,
input wire [7:0] pin_no,
input wire [7:0] data,
input wire sysclk,
input wire reset,
output reg [3:0] addr,
output reg done,
output reg found);
// your work
parameter WAIT=2'b00, CHECK=2'b10, DONE=2'b01;
reg [1:0] state, nextstate;

always @(posedge sysclk) begin //state memory (Current State Register/Transition block)
    if (reset) state<=WAIT;
    else state<=nextstate;
end

always @(posedge sysclk) begin // 连续运行
    addr = addr+4'd1;
end
    
always @(*) begin //NEXT STATE LOGIC
    case(state)
    WAIT: begin
    if (start==1) nextstate = CHECK;
    else nextstate = WAIT;
    end
    
    CHECK: begin

    if ((pin_no == data)||(addr == 4'b1111)) nextstate = DONE;
    else nextstate = CHECK;
    end
    
    DONE: begin
    if (reset) nextstate = WAIT;
    else nextstate = DONE;
    end
    
    default: nextstate = WAIT;
    endcase
end
    
always @(*) begin// FSM combinational output logic

    case(state)
    WAIT: begin
    found = 0;
    done = 0;
    end
    
    CHECK: ;
    
    DONE: begin
    done = state[0];
    found = state[0]&(pin_no==data);
    end
    
    default: ;
    endcase
end

endmodule
