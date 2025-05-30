//Design code
module mealy_over(
  input x,
  input clk,
  input rst,
  output y);
  
  parameter A=2'b00;
  parameter B=2'b01;
  parameter C=2'b10;
  
  reg [1:0]st,nxst;
  
  always@(posedge clk)begin
    if(rst)
      st<=A;
    else
      st<=nxst;
  end
  always@(st or x)begin
    case(st)
      A:begin
         if(x==0)
          nxst<=A;
         else
          nxst<=B;
      end
      B:begin
         if(x==0)
          nxst<=A;
         else
          nxst<=C;
      end
      C:begin
         if(x==0)
          nxst<=A;
         else
          nxst<=C;
      end
    endcase
  end
  
  assign y= (st==C) && (x==1);
endmodule


//Testbench
module mealy_over_tb;
  reg x,clk,rst;
  wire y;
  mealy_over dut(x,clk,rst,y);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst = 1; x = 0; #10;
    rst=0;
    x=1'b0;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    x=1'b0;#10;
    x=1'b1;#10;
    $finish;
  end
  initial begin
    $dumpfile("mealy_over.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("$Time=%0t,x=%b,clk=%b,rst=%b,y=%b",$time,x,clk,rst,y);
  end
endmodule
