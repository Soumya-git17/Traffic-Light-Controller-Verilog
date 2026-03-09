module top(
    input clk, rst,
    output A_red, A_yellow, A_green,
    output B_red, B_yellow, B_green
);

wire slow_clk;

slow_clk_gen u1 (
    .clk(clk),
    .rst(rst),
    .slow_clk(slow_clk)
);

tlc u2 (
    .clk(slow_clk),
    .rst(rst),
    .A_red(A_red),
    .A_yellow(A_yellow),
    .A_green(A_green),
    .B_red(B_red),
    .B_yellow(B_yellow),
    .B_green(B_green)
);

endmodule