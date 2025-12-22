module tb;
    reg clk1,clk2;
	reg rst1,rst2;
	reg en1,en2;
 	reg [1:0]addr1,addr2;
  	reg [7:0]data_in1,data_in2;
	wire [7:0]data_out1,data_out2;
  
  true_dpram dut(clk1,clk2,rst1,rst2,en1,en2,addr1,addr2,data_in1,data_in2,data_out1,data_out2);
  
  initial  begin
    clk1 = 0;
    forever #5 clk1 = ~clk1;
  end
  initial  begin
    clk2 = 0;
    forever #5 clk2 = ~clk2;
  end
  initial begin
    rst1 = 1'b1;
    #15;
    rst1 = 1'b0;
    en1 = 1'b1;
    addr1 = 2'b00;
    data_in1 = 8'hac;
    #15;
    en1 = 1'b0;
  end
  initial begin
    rst2 = 1'b1;
    #15;
    rst2 = 1'b0;
    en2 = 1'b1;
    addr2 = 2'b10;
    data_in2 = 8'hef;
    #15;
    en2 = 1'b0;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100;
    $finish;
  end
endmodule
  
