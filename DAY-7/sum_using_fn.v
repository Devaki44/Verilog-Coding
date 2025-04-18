//Design code
module sum(
  input[7:0]x,y,
  output[7:0]out);
  assign out=add_num(x,y);
  function [7:0]add_num;
   input [7:0]x,y;
    begin
     add_num=x+y;
    end
  endfunction
endmodule


//Testbench
module sum_tb();
  reg [7:0]x,y;
  wire [7:0]out;
  sum uut(x,y,out);
  initial begin
    integer i,j;#5;
    for(i=0;i<31;i=i+1)begin
      for(j=0;j<31;j=j+1)begin
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
    
