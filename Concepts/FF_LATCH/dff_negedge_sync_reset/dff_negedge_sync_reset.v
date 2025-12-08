module dff_negedge_sync_reset (
    input clk,
    input rst, // active high sync reset
    input d,
    output reg q
);
    always @(negedge clk) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end
endmodule
