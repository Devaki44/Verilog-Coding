//Design code
module onebit_shift_func(
  input [7:0]a,
  input [3:0]shift,
  output reg[7:0]out);
  
  function [7:0]result;
    input [7:0]x;
    result=a>>shift;
  endfunction
  
  always@(*)begin
    out=result(a);
  end
endmodule


//Testbench
module onebit_shift_func_tb;
  reg [7:0]a;
  reg [3:0]shift;
  wire [7:0]out;
  
  onebit_shift_func uut(a,shift,out);
  
  initial begin
    a=8'd64;shift=4'd5;#5;
    a=8'd128;shift=4'd7;#5;
    a=8'd255;shift=4'd7;#5;
    $finish;
  end
  initial begin
    $monitor("$Time=%0t,a=%b,shift=%b;out=%b",$time,a,shift,out);
  end
endmodule
  
  
