module clock_div_4(
  input      clk,
  input      rst,
  output reg out_clk ) ;
  
  reg count;

  always @ (posedge clk) begin
//      count <=1'b0;
    if (rst) begin
     out_clk <= 1'b0;
     count   <= 1'b0;
   end
   else begin
     count <= count+1;
     if(count==1'b1)
        out_clk <= ~ out_clk;   
   end
  end
endmodule
  
