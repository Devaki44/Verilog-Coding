module testbench;
  reg clk;
  reg rst;
  reg din;
  reg detect;
  
   code #(
    .LEN(8),
    .pattern(8'b1011_1101)
  ) dut (
    .clk(clk),
    .rst(rst),
    .din(din),
    .detect(detect)
  );
  
  initial begin
    clk =  0;
    forever #5 clk = ~clk ;
  end
  
  initial begin
    rst = 1;
    #20;
    rst = 0;
    //
    din =1;
    #10;
    din =0;
    #10;
    din =1;
    #10;
    din =1;
    #10;
    //
    din =1;
    #10;
    din =1;
    #10;
    din =0;
    #10;
    din =1;
    #100;
    
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
              
