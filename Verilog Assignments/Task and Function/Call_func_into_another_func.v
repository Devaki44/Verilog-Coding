//Design code
module func_call_func(
  input [3:0]a,b,
  output reg[3:0]out_1);
  
  function [3:0]out_2;
    input [3:0]x,y;
    out_2=x+y;
  endfunction
  
  function [3:0]out_3;
    input [3:0]p,q;
    out_3=out_2(p,q)+1'b1;
  endfunction
  
  always@(*)begin
    out_1=out_3(a,b);
  end
endmodule

//Testbench
module func_call_func_tb;
  reg [3:0]a,b;
  wire [3:0]out_1;
  
  func_call_func uut(a,b,out_1);
  initial begin
    a=4'd1;b=4'd4;#5;
    a=4'd9;b=4'd4;#5;
    a=4'd9;b=4'd8;#5;
  end
  initial begin
    $monitor("$Time=%0t,a=%b,b=%b,out_1=%b",$time,a,b,out_1);
  end
endmodule
