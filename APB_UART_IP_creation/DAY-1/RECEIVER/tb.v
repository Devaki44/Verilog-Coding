module testbench;
  reg clk ;
  reg rst;
  reg receive;
  reg rx;
  wire [7:0]data_out;
  
  top_module dut(clk,rst,receive,rx,data_out);
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk ;
  end
  initial begin
    rst = 1;
    #100;
    rst = 0;
    receive = 1'b1;
    rx =1;
    #500_000;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
    
