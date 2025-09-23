module tb;
  parameter WIDTH = 4;
  
  reg clk;
  reg rst;
  reg[WIDTH-1 : 0]data_in;
  wire [WIDTH-1 : 0]data_out;
  
  synchronizer #(WIDTH)	dut(clk,rst,data_in,data_out);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk ;
  end
  initial begin
    rst = 1;data_in = 4'hf;
    #30;
    rst = 0;
    #200;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
    
endmodule
