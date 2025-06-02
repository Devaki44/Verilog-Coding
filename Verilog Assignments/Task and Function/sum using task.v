//Design code
module sum_task(
  input [3:0]a,b,
  output reg [3:0]result);
  
  task sum;
    input [3:0]x,y;
    output reg [3:0]add;
    add=x+y;
  endtask
  
  always@(*)begin
    sum(a,b,result);
  end
  
  endmodule

//Testbench
module sum_task_tb;
  reg [3:0]a,b;
  wire [3:0]result;
  
  sum_task dut(a,b,result);
  initial begin
    a=4'd3;b=4'd5;#5;
    a=4'd4;b=4'd4;#5;
    a=4'd5;b=4'd6;#5;
    a=4'd6;b=4'd8;#5;
    $finish;
  end
  initial begin
    $dumpfile("sum_task.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("$Time=%0t,a=%b,b=%b,result=%b",$time,a,b,result);
  end
endmodule

