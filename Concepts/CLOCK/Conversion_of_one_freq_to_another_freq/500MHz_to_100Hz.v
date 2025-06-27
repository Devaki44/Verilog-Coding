module fre_div(
  input clk,
  input rst,
  output reg out_clk);
  
  reg [25:0]count;
  
  always@(posedge clk)begin
    if(rst)begin
      count <= 0;
      out_clk <= 0;
    end
    else begin

      if(count == 2_499_999)begin
        count <= 0 ;
        out_clk <= ~out_clk ;
	
      end
      else begin
        count <= count + 1 ;
      end
    end
  end
endmodule
