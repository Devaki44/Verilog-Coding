//Design code
module arithmetic_operations(
  input [3:0]a,b,
  output reg [15:0]mul,div);
  
  function [15:0]mul_f;
    input [3:0]x,y;
    mul_f=x*y;
  endfunction
  
  function [15:0]div_f;
    input [3:0]x,y;
    div_f=x/y;
  endfunction
  
  
  always@(*)begin
    mul=mul_f(a,b);
    div=div_f(a,b);
  end
  
  endmodule


//TESTCASE
module arithmetic_operations_tb;
  reg [3:0]a,b;
  wire[15:0]mul,div;
  real data1, data2, result;
  arithmetic_operations dut(a,b,mul,div);
  initial begin
            	$monitor("$Time=%0t,a=%0d,b=%0d,mul=%0d,div=%.2f",$time,a,b,mul,div);

    a=4'd3;b=4'd5;#5;
    a=4'd8;b=4'd4;#5;
    a=4'd5;b=4'd4;#5;
    a=4'd6;b=4'd8;#5;
    
    data1 = 5;
    data2 = 2;
    result = data1 / data2;
    $display(" data1 = %0d data2 = %0d result = %0.2f", data1, data2, result);
    

    $finish;
  end
endmodule
