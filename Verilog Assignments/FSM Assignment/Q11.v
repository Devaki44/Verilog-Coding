//Design code
module fsm_moore(clk,rst,x,y);
  input wire x,clk,rst;
  output reg y;
  
  parameter OFF=1'b0;
  parameter ON=1'b1;
  
  reg s,ns;
  
  always@(posedge clk )begin
    if(rst)
      s<=OFF;
    else
      s<=ns;
  end
  always@(s or x)begin
    case(s)
      OFF:begin
        if(x==0)
          ns<=OFF;
        else
          ns<=ON;
        end
      ON:begin
        if(x==0)
          ns<=ON;
        else
          ns<=OFF;
        end
      default:ns<=OFF;
    endcase
  end
  always@(*)begin
    case(s)
      OFF:y=0;
      ON:y=1;
    endcase
  end
endmodule
      
      
//Testbench
module fsm_moore_tb();
  wire y;
  reg x,rst,clk;
  fsm_moore uut(.x(x),.rst(rst),.clk(clk),.y(y));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1'b1;x=1'b1;#10;
    rst=1'b1;x=1'b1;#10;
    
    rst=1'b0;x=1'b1;#10;
    rst=1'b0;x=1'b1;#10;
    rst=1'b0;x=1'b0;#10;
    rst=1'b0;x=1'b1;#10; 
    rst=1'b0;x=1'b1;#10;
    rst=1'b0;x=1'b0;#10;
    rst=1'b0;x=1'b1;#10;
    rst=1'b0;x=1'b1;#10;
    rst=1'b0;x=1'b0;#10;
    rst=1'b0;x=1'b1;#10;
    #1;$finish;
  end
  initial begin
    $dumpfile("fsm_moore.vcd");
    $dumpvars(1,fsm_moore_tb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|x=%b|y=%b",$time,rst,clk,x,y);
  end
endmodule
