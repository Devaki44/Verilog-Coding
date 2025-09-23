module synchronizer #(parameter WIDTH = 4)(
  input clk,
  input rst,
  input [WIDTH-1 : 0]data_in,
  output reg [WIDTH-1 : 0]data_out);
  
  reg [WIDTH-1 : 0]q ;
  
  always@(posedge clk)begin
    if(rst)begin
      data_out <= 0;
      q		   <= 0;
    end
    else begin
      q		   <= data_in ;
      data_out <= q;
    end
  end
endmodule
