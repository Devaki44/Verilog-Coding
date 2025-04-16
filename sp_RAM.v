//Design  code 
module sp_RAM(
  input clk,
  input w_en,
  input [9:0]address,
  input [7:0]din,
  output reg [7:0]dout);
  reg[7:0]ram[0:1023];
  always@(posedge clk)begin
    if(w_en)
      ram[address]<= din;
    else
      dout<=ram[address];
  end
endmodule

//Testbench
module sp_RAM_tb();
  reg clk;
  reg w_en;
  reg [9:0]address;
  reg [7:0]din;
  wire [7:0]dout;
  wire [7:0]ram[1023:0];
  sp_RAM uut(clk,w_en,address,din,dout);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $dumpfile("sp_RAM.vcd");
    $dumpvars(1,sp_RAM_tb);
  end
  initial begin
    w_en=1;address=66;din=8'b00001001;#10;
    w_en=0;address=66;din=8'b00001001;#10;
    w_en=1;address=42;din=8'b00001111;#10;
    w_en=0;address=42;din=8'b00001001;#10;
    $finish;
  end
  initial begin
    $monitor("$Time=%0t|clk=%b|w_en=%b|address=%d|din=%b|dout=%b",$time,clk,w_en,address,din,dout);
  end
endmodule
