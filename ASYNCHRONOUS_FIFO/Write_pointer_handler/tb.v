module tb;
  
  parameter PTR_WIDTH = 4;
  
  reg w_clk,w_en,w_rst;
  reg [PTR_WIDTH-1 :0]g_rptr_sync;
  wire [PTR_WIDTH-1 :0]b_wptr,g_wptr;
  wire full;
  
  wptr_handler #(PTR_WIDTH) dut(w_clk,w_en,w_rst,g_rptr_sync,b_wptr,g_wptr,full);
  
  initial begin
    w_clk = 1;
    forever #5 w_clk = ~w_clk ;
  end
  initial begin
    w_rst = 1;
    #15;
    w_rst = 0;
    w_en  = 1;
    g_rptr_sync = 4'b0000;
    #200;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
    
  
  
