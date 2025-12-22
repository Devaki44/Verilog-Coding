module tb;
    reg clk1,clk2;
  	reg rst1,rst2;
  	reg w_en;
  	reg r_en;
  	reg [2:0]addr1;
  	reg [2:0]addr2;
  reg [7:0]data_in2;	
 	wire [7:0]data_out;
  
  simple_dpram dut(clk1,clk2,rst1,rst2,w_en,r_en,addr1,addr2,data_in2,data_out);
  
  initial begin
    clk1 = 0;
    forever #5 clk1 = ~clk1;
  end
  initial begin
    clk2 = 0;
    forever #5 clk2 = ~clk2;
  end
  initial begin
    rst1 =  1;
    rst2 = 1;
    #15;
    rst1 = 0;
    rst2 = 0;
    w_en = 1;
    addr2 = 2'b00;
    data_in2 = 8'hdd;
    #10;
    r_en = 1;
    addr1 = 2'b00;
//     w_en = 1;
//     addr2 = 2'b01;
//     data_in1 = 8'hae;
    #20;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule






https://www.edaplayground.com/x/AL2Y - simple
https://www.edaplayground.com/x/XSU3 - true
