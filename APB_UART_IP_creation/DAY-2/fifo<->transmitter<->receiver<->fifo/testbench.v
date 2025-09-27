module testbench;
  reg clk;
  reg rst;
  reg w_en;
  reg [7:0]d_in;

  wire [7:0]data_out;

  topmodule uut(clk,rst,w_en,d_in,data_out);

  initial begin
    clk = 0;
    forever #10 clk = ~clk ;
  end
  initial begin
    rst = 1;
    #20;
    rst = 0;
    w_en = 1;
    d_in = 8'hd4 ;
    #20;
    w_en = 0;
    #5000_000;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
