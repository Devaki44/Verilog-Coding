module testbench;
  
  parameter DEPTH = 8 ;
  parameter DATA_WIDTH = 3;
  
  reg w_clk,r_clk;
  reg w_en,r_en;
  reg w_rst,r_rst;
  reg [DATA_WIDTH-1 : 0]data_in;
  
  wire [DATA_WIDTH-1 :0]data_out;
  wire wirefull,empty;
  
  top_module #(DEPTH,DATA_WIDTH) dut(w_clk,r_clk,w_en,r_en,w_rst,r_rst,data_in,data_out,full,empty);
  
  initial begin
    w_clk = 0;
    forever #5 w_clk = ~w_clk ;
  end
  initial begin
    r_clk = 0;
    forever #10 r_clk = ~r_clk ;
  end
  initial begin
    w_en = 0;
    r_en = 0;
    
    #300;
    $finish;
  end
  initial begin
    w_rst = 1;r_rst = 1;
    #15;
    w_rst = 0;
    #30;
    r_rst = 0;
  end
  
  initial begin
    #15;
    repeat(10)begin
      if(!full)begin
       w_en = 1;
       data_in = $random;
       #10; 
      end
     end
     w_en = 0;
     #5;
     repeat(10)begin
        if(!empty)begin
          r_en = 1;
        end
     end
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
