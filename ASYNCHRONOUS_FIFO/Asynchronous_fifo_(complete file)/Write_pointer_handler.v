module wptr_handler #(parameter PTR_WIDTH = 3)(
  input w_clk,w_en,w_rst,
  input [PTR_WIDTH :0]g_rptr_sync,
  output reg [PTR_WIDTH :0]b_wptr,g_wptr,
  output reg full);
  
  wire [PTR_WIDTH :0]b_wptr_next;
  wire [PTR_WIDTH :0]g_wptr_next;
  wire wfull;
  
  always@(posedge w_clk )begin
    if(w_rst)begin
      b_wptr <= 0;
      g_wptr <= 0;
      full <= 0;
    end
    else begin
      b_wptr <= b_wptr_next ;
      g_wptr <= g_wptr_next ;
      full <= wfull       ;
    end
  end
  
  assign b_wptr_next = b_wptr + (w_en & !full);
  assign g_wptr_next = (b_wptr_next >> 1)^(b_wptr_next) ;
  assign wfull 		 = (g_wptr_next == {~g_rptr_sync[PTR_WIDTH:PTR_WIDTH-1], g_rptr_sync[PTR_WIDTH-2:0]});

endmodule
