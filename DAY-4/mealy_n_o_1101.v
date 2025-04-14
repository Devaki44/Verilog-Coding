//Design code
module fsm_mealy(clk,rst,x,y);
  input wire x,clk,rst;
  output reg y;
  
  parameter a=4'b0001;
  parameter b=4'b0010;
  parameter c=4'b0100;
  parameter d=4'b1000;
  
  reg [3:0]s,ns;
  
  always@(posedge clk or posedge rst)begin
    if(rst)
      s<=a;
    else
      s<=ns;
  end
  always@(s or x)begin
    case(s)
      a:begin
        if(x==0)
          ns<=a;
        else
          ns<=b;
        end
      b:begin
        if(x==0)
          ns<=a;
        else
          ns<=c;
        end
      c:begin
        if(x==0)
          ns<=d;
        else
          ns<=c;
        end
      d:begin
        if(x==0)
          ns<=a;
        else
          ns<=a;
        end
      default:ns<=a;
    endcase
  end
  always@(*)begin
    case(s)
      a:y=0;
      b:y=0;
      c:y=0;
      d:y=1;
    endcase
  end
endmodule


//Testbench
module fsm_mealy_tb();
  wire y;
  reg x,rst,clk;
  fsm_mealy uut(.x(x),.rst(rst),.clk(clk),.y(y));
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
    $dumpfile("fsm_mealy.vcd");
    $dumpvars(1,fsm_mealy_tb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|x=%b|y=%b",$time,rst,clk,x,y);
  end
endmodule
