module fsm_controller(input wire sysclk,
input wire ready,
input wire done,
input wire closed,
input wire found,
input wire reset_btn,
output reg start,
output reg reset,
output reg acc_gran);
// your work
parameter IDLE=2'b00, COMPARE=2'b10, RESULT=2'b01, GRANT=2'b11;
reg [1:0] state, nextstate;

always @(posedge sysclk) begin //state memory (Current State Register/Transition block)
    if (reset_btn) state<=IDLE;
    else state<=nextstate;
end

always @(*) begin //NEXT STATE LOGIC
    case(state)
    IDLE: begin
    if (ready) nextstate = COMPARE;
    else nextstate = IDLE;
    end
    
    COMPARE: begin
    if (done) nextstate = RESULT;
    else nextstate = COMPARE;
    end
    
    RESULT: begin
    if (found) nextstate = GRANT;
    else nextstate = RESULT;
    end
    
    GRANT: begin
    if (closed) nextstate = IDLE;
    else nextstate = GRANT;
    end
    
    default: nextstate = IDLE;
    endcase
end


always @(*) begin// FSM combinational output logic

    case(state)
    IDLE: begin
    if (reset_btn==1) reset = 1;
    start = 0;
    acc_gran = 0;
    end
    
    COMPARE: begin
    reset = 0;
    start = 1;
    acc_gran = 0;
    end
    
    RESULT: begin reset = 0;
    start = 0;
    acc_gran = 0; end
    
    GRANT: begin
    acc_gran = 1;
    start = 0;
    if (closed==1) reset=1;
    end
    
    default: ;
    endcase
end

endmodule

