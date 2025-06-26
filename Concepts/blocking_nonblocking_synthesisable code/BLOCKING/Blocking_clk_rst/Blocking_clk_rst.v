module blocking(
  input clk,
  input rst,
  input [3:0]a,b,
  output reg [3:0]x,y,z);
  
  always@(posedge clk)begin
    if(rst)begin
      x=0;
      y=0;
      z=0;
    end
    else begin
      x = a ;
   	  y = b ;
      z = y ;
    end
  end
endmodule
