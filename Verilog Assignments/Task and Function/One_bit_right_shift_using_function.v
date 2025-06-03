//Design code
module onebit_shift_func(
  input [3:0]a,
  output reg[3:0]out);
  
  function [3:0]result;
    input [3:0]x;
    result=a>>1;
  endfunction
  
  always@(*)begin
    out=result(a);
  end
endmodule

//Testbench
module onebit_shift_func_tb;
  reg [3:0]a;
  wire [3:0]out;
  
  onebit_shift_func uut(a,out);
  
  initial begin
    a=4'b0001;#5;
    a=4'b0111;#5;
    a=4'b1001;#5;
    a=4'b0101;#5;
    $finish;
  end
  initial begin
    $monitor("$Time=%0t,a=%b,out=%b",$time,a,out);
  end
endmodule
  
