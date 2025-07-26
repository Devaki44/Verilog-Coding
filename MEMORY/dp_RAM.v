//Design code
module dp_RAM(
  input clk1,clk2,
  input wen1,wen2,
  input [9:0]add1,add2,
  input [7:0]din1,din2,
  output reg [7:0]dout1,
  output reg [7:0]dout2);
  reg [7:0]ram1[0:1023];
  reg [7:0]ram2[0:1023];
  always@(posedge clk1)begin
    if(wen1)
      ram1[add1]<= din1;
    else
      dout1<=ram1[add1];
  end
  always@(posedge clk2)begin
    if(wen2)
      ram2[add2]<= din2;
    else
      dout2<=ram2[add2];
  end
endmodule


/Testbench
module dp_RAM_tb();
  reg clk1,clk2;
  reg wen1,wen2;
  reg [9:0]add1,add2;
  reg [7:0]din1,din2;
  wire [7:0]dout1,dout2;
  wire [7:0]ram1[0:1023];
  wire [7:0]ram2[0:1023];
  dp_RAM uut(clk1,clk2,wen1,wen2,add1,add2,din1,din2,dout1,dout2);
  initial begin
    clk1=0;
    forever #5 clk1=~clk1;
  end
  initial begin
    clk2=0;
    forever #5 clk2=~clk2;
  end
  initial begin
    $dumpfile("dp_RAM.vcd");
    $dumpvars(1,dp_RAM_tb);
  end
  initial begin
    wen1=1;add1=66;din1=8'b00001001;#10;
    wen1=0;#10;
    wen1=0;add1=66;din1=8'b00001001;#10;
    wen1=0;#10;
    wen1=1;add1=42;din1=8'b00001111;#10;
    wen1=0;#10;
    wen1=0;add1=42;din1=8'b00001001;#10;
    wen1=0;#10;
  end
  initial begin
    wen2=1;add2=66;din2=8'b00001001;#10;
    wen2=0;#10;
    wen2=0;add2=66;din2=8'b00001001;#10;
    wen2=0;#10;
    wen2=1;add2=42;din2=8'b00001111;#10;
    wen2=0;#10;
    wen2=0;add2=42;din2=8'b00001001;#10;
    wen2=0;#10;
    $finish;
  end
  initial begin
    $monitor("$Time=%0t|clk1=%b|clk2=%0b|wen1=%b|wen2=%b|add1=%d|add2=%d|din1=%b|din2=%b|dout1=%b|dout2=%b",$time,clk1,clk2,wen1,wen2,add1,add2,din1,din2,dout1,dout2);
  end
 
endmodule
