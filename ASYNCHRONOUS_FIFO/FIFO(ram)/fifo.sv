module fifo #(parameter WIDTH = 8,
              			PTR_WIDTH = $clog2(DEPTH),
             			DEPTH     = 8)(
  input w_clk,w_en,
  input [PTR_WIDTH-1 : 0]w_ptr,
  input r_clk,r_en,
  input [PTR_WIDTH-1 :0]r_ptr,
  input [WIDTH-1 : 0]data_in,
  input full,empty,
  output reg [WIDTH-1 : 0]data_out);
  
  reg [WIDTH-1 : 0]ram[DEPTH-1 :0] ;
  
  always@(posedge w_clk)begin
    if(w_en && !full)begin
      ram[w_ptr] 		<= data_in;
    end
  end
  
  always@(posedge r_clk)begin
    if(r_en && !empty)begin
      data_out			<= ram[r_ptr];
    end
  end
endmodule
  
