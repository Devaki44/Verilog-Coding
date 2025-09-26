module testbench;
  reg clk;
  reg rst;
  wire baud_tick ;
  
  baud_gen dut(clk,rst,baud_tick);
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  initial begin
    rst = 1;
    #20;
    rst = 0;
    #50_000_000;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
