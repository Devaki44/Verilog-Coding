//Design code
module clock_div_2(
  input      clk,
  input      rst,
  output reg out_clk1 ) ;


  always @ (posedge clk) begin
    if (rst) begin
     out_clk1 <= 1'b0;
   end
   else begin
     out_clk1 <= ~ out_clk1;
   end
  end
endmodule
  
