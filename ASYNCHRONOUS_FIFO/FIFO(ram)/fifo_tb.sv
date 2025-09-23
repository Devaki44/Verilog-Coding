module fifo_tb;
  
  parameter WIDTH = 8,
            PTR_WIDTH = $clog2(DEPTH),
  			DEPTH     = 8 ;
  
  reg w_clk,w_en;
  reg [PTR_WIDTH-1 : 0]w_ptr;
  reg r_clk,r_en;
  reg [PTR_WIDTH-1 :0]r_ptr;
  reg [WIDTH-1 : 0]data_in;
  reg full,empty;
  wire [WIDTH-1 : 0]data_out;
  
  fifo dut(w_clk,w_en,w_ptr,r_clk,r_en,r_ptr,data_in,full,empty,data_out);
  
  initial begin
    w_clk = 0;
    forever  #5 w_clk = ~w_clk ;
  end
  initial begin
    r_clk = 0;
    forever #10 r_clk =~r_clk ;
  end
  initial begin
    w_en = 1;w_ptr = 3'b111 ;full = 1'b0;data_in = 8'hea;
    empty = 1;r_en = 0;
    #25;
    r_en = 1;r_ptr = 3'b111 ;empty = 1'b0;
    #200;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
    
