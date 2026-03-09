module tlc (
    input clk,rst,
    output reg A_red,A_yellow, A_green,
    output reg B_red, B_yellow, B_green
);

parameter S0 = 4'b0001;
parameter S1 = 4'b0010;
parameter S2 = 4'b0100;
parameter S3 = 4'b1000;

parameter T_GREEN  = 10;
parameter T_YELLOW = 3;

reg [3:0] current_state, next_state;
reg [3:0] max_time, timer;


always @(posedge clk or posedge rst) begin
    if (rst) current_state <= S0;
    else current_state <= next_state;
end

always @(*) begin
    A_green = 0;
    A_red = 0;
    A_yellow = 0;
    B_green = 0;
    B_red = 0;
    B_yellow = 0;
    case (current_state)
        S0 : begin
            A_green = 1;
            B_red = 1;
        end
        S1 : begin
            A_yellow = 1;
            B_red = 1;
        end
        S2 : begin
            A_red = 1;
            B_green = 1;
        end
        S3 : begin
            A_red = 1;
            B_yellow = 1;
        end
        default: begin
            A_red = 1;
            B_red = 1;
        end
    endcase
end

always @(*) begin
    case (current_state)
        S0: max_time = T_GREEN;
        S1: max_time = T_YELLOW;
        S2: max_time = T_GREEN;
        S3: max_time = T_YELLOW;
        default: max_time = T_GREEN;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst)
        timer <= 0;
    else if (timer == max_time - 1)
        timer <= 0;
    else
        timer <= timer + 1;
end

always @(*) begin
    case(current_state)
        S0: next_state = (timer == max_time-1) ? S1 : S0;
        S1: next_state = (timer == max_time-1) ? S2 : S1;
        S2: next_state = (timer == max_time-1) ? S3 : S2;
        S3: next_state = (timer == max_time-1) ? S0 : S3;
        default: next_state = S0;
    endcase
end

endmodule