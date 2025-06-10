module clock_div_4(
  input clk,
  input rst,
  output reg out_clk2);
  
  reg out_clk1;
   reg w1;
  initial 
    w1 = 1;
  always@(posedge clk)begin
    
    if(rst)begin
      out_clk1 <= 1'b0;
      out_clk2 <= 1'b0;
    end
    else begin  
      out_clk1 <= ~out_clk1;
      if(out_clk1)
      out_clk2 <= ~out_clk2;
    end
  end
  
endmodule
