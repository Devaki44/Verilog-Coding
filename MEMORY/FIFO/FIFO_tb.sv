//TESTBENCH
module fifo_tb;
  reg clk,rst;
  reg w_en;
  reg [7:0]data_in;
  wire [7:0]data_out;
  reg full,empty;
  
  fifo dut(clk,rst,w_en,data_in,data_out,full,empty);
  
  initial begin
    clk = 0;
    forever #5 clk = ~ clk ;
  end
  initial begin
    rst = 1;#10;
    rst = 0; w_en=1 ; data_in = 8'hfa ;#10;
    w_en=0;#100;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
