module slow_clk_gen (
    input clk,
    input rst,
    output reg  slow_clk
);

reg [25:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 26'd0;
        slow_clk <= 1'b0;
    end 
    else begin
        if (counter == 26'd49_999_999) begin
            counter <= 26'd0;
            slow_clk <= ~slow_clk;
        end 
        else begin
            counter <= counter + 1;
        end
    end
end

endmodule