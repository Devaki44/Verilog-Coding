//Design code
module sub(
  input [7:0]x,y,
  output reg[7:0]out);
  always@(*)begin
    sub_num(x,y,out);
  end
  task sub_num;
    input [7:0]a,b;
    output [7:0]sub;
    begin
      sub=a-b;
    end
  endtask
endmodule


//Testbench
module sub_num_tb();
  reg [7:0]x,y;
  wire[7:0] out;
  sub uut(x,y,out);
  initial begin
    integer i,j;
    for(i=0;i<127;i=i+1)begin
      for(j=0;j<127;j=j+1)begin
         x=i;#5;
         y=j;#5;
      end
    end
  $finish;
  end
  initial begin
    $monitor("Time=%0t|x=%b|y=%b|out=%b",$time,x,y,out);
  end
endmodule
    
  
