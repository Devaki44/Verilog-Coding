module synchronizer #(parameter PTR_WIDTH = 3)(
  input clk,
  input rst,
  input [PTR_WIDTH : 0]data_in,
  output reg [PTR_WIDTH: 0]data_out);
  
  reg [PTR_WIDTH: 0]q ;
  
  always@(posedge clk)begin
    if(rst)begin
      data_out <= 0;
      q	<= 0;
    end
    else begin
      q	<= data_in ;
      data_out <= q;
    end
  end
endmodule
