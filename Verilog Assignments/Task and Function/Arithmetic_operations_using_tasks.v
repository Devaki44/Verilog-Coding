//Design code
module arithmetic_task(
  input [3:0]x,y,
  output reg [11:0]sum,sub,mul,div);
  
  task sum_t;
    input [3:0]a,b;
    output [11:0]sum_t;
    sum_t=a+b;
  endtask
   
  task sub_t;
    input [3:0]a,b;
    output [11:0]sub_t;
    sub_t=a-b;
  endtask
  
  task mul_t;
    input [3:0]a,b;
    output [11:0]mul_t;
    mul_t=a*b;
  endtask
  
  task div_t;
    input [3:0]a,b;
    output [11:0]div_t;
    div_t=a%b;
  endtask
  
  always@(*)begin
    sum_t(x,y,sum);
    sub_t(x,y,sub);
    mul_t(x,y,mul);
    div_t(x,y,div);
  end
  
endmodule
  
    
  //Testbench
module arithmetic_task_tb;
  reg [3:0]x,y;
  wire [11:0]sum,sub,mul,div;
  
  arithmetic_task dut(x,y,sum,sub,mul,div);
  initial begin
    x=4'd13;y=4'd12;#5;
    x=4'd14;y=4'd12;#5;
    $finish;
  end
  initial begin
    $monitor("$Time=%0t,x=%b,y=%b,sum=%b,sub=%b,mul=%b,div=%b",$time,x,y,sum,sub,mul,div);
  end
endmodule

  
    
  
