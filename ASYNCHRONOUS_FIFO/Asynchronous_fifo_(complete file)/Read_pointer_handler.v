module rptr_handler #(parameter PTR_WIDTH = 3)(
  input r_clk,r_en,r_rst,
  input [PTR_WIDTH :0]g_wptr_sync,
  output reg [PTR_WIDTH :0]b_rptr,g_rptr,
  output reg empty);
  
  wire [PTR_WIDTH :0]b_rptr_next;
  wire [PTR_WIDTH :0]g_rptr_next;
  wire rempty;
  
  always@(posedge r_clk)begin
    if(r_rst)begin
      b_rptr <= 0;
      g_rptr <= 0;
      empty  <= 1;
    end
    else begin
      b_rptr <= b_rptr_next ;
      g_rptr <= g_rptr_next ;
      empty  <= rempty;
    end
  end
  
  assign b_rptr_next = b_rptr + (r_en && !empty);
  assign g_rptr_next = (b_rptr_next >> 1)^(b_rptr_next) ;
  assign rempty		 = (g_rptr_next == g_wptr_sync);
endmodule
