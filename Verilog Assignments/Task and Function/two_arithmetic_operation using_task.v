//Design code
module arithmetic_task(
  input [3:0]x,y,
  output reg [7:0]add,min);
  
  task sum;
    input [3:0]a,b;
    output [7:0]sum;
    sum=a+b;
  endtask
   
  task sub;
    input [3:0]a,b;
    output [7:0]sub;
    sub=a-b;
  endtask
  
  always@(*)begin
   sum(x,y,add);
   sub(x,y,min);
  end
endmodule
  
    
  //Testbench
module arithmetic_task_tb;
  reg [3:0]x,y;
  wire [7:0]add,min;
  
  arithmetic_task dut(x,y,add,min);
  initial begin
    x=4'd13;y=4'd12;#5;
    x=4'd10;y=4'd2;#5;
    $finish;
  end
  initial begin
    $monitor("$Time=%0t,x=%b,y=%b,add=%b,min=%b",$time,x,y,add,min);
  end
endmodule
  
