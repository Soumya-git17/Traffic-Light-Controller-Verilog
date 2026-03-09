`timescale 1ns/1ps
`include "tlc.v"

module tlc_tb;
reg clk;
reg rst;
wire A_red, A_yellow, A_green;
wire B_red, B_yellow, B_green;

tlc uut (
    .clk(clk),
    .rst(rst),
    .A_red(A_red),
    .A_yellow(A_yellow),
    .A_green(A_green),
    .B_red(B_red),
    .B_yellow(B_yellow),
    .B_green(B_green)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("tlc.vcd");
    $dumpvars(0, tlc_tb);
    rst = 1;
    #20;
    rst = 0;
    #400;
    $finish;
end

// Safety Check: No Collision
always @(posedge clk) begin
    if (A_green && B_green) begin
        $display("ERROR: Collision detected at time %t", $time);
        $stop;
    end
end

initial begin
    $monitor("Time=%0t | A: R=%b Y=%b G=%b | B: R=%b Y=%b G=%b",
              $time,
              A_red, A_yellow, A_green,
              B_red, B_yellow, B_green);
end

endmodule