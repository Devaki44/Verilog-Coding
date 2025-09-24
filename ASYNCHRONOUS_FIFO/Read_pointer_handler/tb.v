module tb;
  
  parameter PTR_WIDTH = 4;
  
  reg r_clk,r_en,r_rst;
  reg [PTR_WIDTH-1 :0]g_wptr_sync;
  wire [PTR_WIDTH-1 :0]b_rptr,g_rptr;
  wire full;
  
  rptr_handler #(PTR_WIDTH) dut(r_clk,r_en,r_rst,g_wptr_sync,b_rptr,g_rptr,empty);
  
  initial begin
    r_clk = 1;
    forever #10 r_clk = ~r_clk ;
  end
  initial begin
    r_rst = 1;
    #15;
    r_rst = 0;
    r_en  = 1;
    g_wptr_sync = 3'b000;
    #200;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
    
  
  
