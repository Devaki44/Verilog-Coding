module testbench;
  reg clk;
  reg rst;
  reg transfer;
  reg [7:0]data_in;
  
  wire [7:0]data_out;
  
  topmodule uut(clk,rst,transfer,data_in,data_out);
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk ;
  end
  initial begin
    rst = 1;
    #20;
    rst = 0;
    transfer = 1;
    data_in = 8'hd4 ;
    #500_000;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
