//Design code
module div_5(
  input x,
  input clk,
  input rst,
  output reg y);
  
  parameter A=4'b0000;
  parameter B=4'b0001;
  parameter C=4'b0010;
  parameter D=4'b0011;
  parameter E=4'b0100;
  parameter F=4'b0101;
  
  
  reg [2:0]st,nxst;
  
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
          nxst<=C;
         else
          nxst<=D;
      end
      C:begin
         if(x==0)
          nxst<=E;
         else
          nxst<=F;
      end
      D:begin
         if(x==0)
          nxst<=B;
         else
          nxst<=C;
      end
      E:begin
         if(x==0)
          nxst<=D;
         else
          nxst<=E;
      end
      F:begin
         if(x==0)
          nxst<=A;
         else
          nxst<=B;
      end
    endcase
  end
  
  always@(*)begin
    case(st)
      A:y=0;
      B:y=0;
      C:y=0;
      D:y=0;
      E:y=0;
      F:y=1;
      default:y=0;
    endcase
  end

endmodule

//Testbench
module div_5_tb;
  reg x,clk,rst;
  wire y;
  div_5 dut(x,clk,rst,y);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst = 1; #10;
    rst=0;
    x=1'b1;#10;
    x=1'b0;#10;
    x=1'b0;#10;
    x=1'b0;#10;
    x=1'b1;#10;
    x=1'b1;#10;
    
    $finish;
  end
  initial begin
    $dumpfile("div_5.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("$Time=%0t,x=%b,clk=%b,rst=%b,y=%b",$time,x,clk,rst,y);
  end
endmodule
