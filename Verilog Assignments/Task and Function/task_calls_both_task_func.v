//Design code
module task_calls(
  input [3:0]a,
  output reg[7:0]out_sq,out_inv);
  
  function [7:0]out_2;//function
    input [3:0]x;
    begin
     out_2=x*x;
    end
  endfunction
  
  task invert;         //Task
    input [3:0]x;
    output [7:0]out_3;
    begin
     out_3=~x;
    end
  endtask
  
  task operation;
    input [3:0]x;
    output [7:0]out_3,out_4;
    begin
      out_3=out_2(x);
      invert(x,out_4);
    end
  endtask
  
  always@(*)begin
    operation(a,out_sq,out_inv);
  end
endmodule


//Testbench
module task_calls_tb;
  reg [3:0]a;
  wire [7:0]out_sq,out_inv;
  
  task_calls uut(a,out_sq,out_inv);
  initial begin
    a=4'b0100;#5;
    a=4'b0011;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,a=%b,out_sq=%b,out_inv=%b",$time,a,out_sq,out_inv);
  end
endmodule
