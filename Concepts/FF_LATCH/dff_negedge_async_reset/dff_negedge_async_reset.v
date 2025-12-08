module dff_negedge_async_reset (
    input clk,
    input rst, // active high async reset
    input d,
    output reg q
);
    always @(negedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end
endmodule
