//Design code
module fsm_mealy(clk,rst,x,y);
  input wire x,clk,rst;
  output y;
  
  parameter a=2'b00;
  parameter b=2'b01;
  parameter c=2'b10;
  
  reg [1:0]s,ns;
  
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
          ns<=a;
        else
          ns<=c;
        end
      default:ns<=a;
    endcase
  end
  assign y=(s==c)&&(x==1);
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
    rst=1'b1;x=1'b1;
    
    @(posedge clk);rst = 0;  x = 0;
    @(posedge clk); x = 1;
    @(posedge clk); x = 1;
    @(posedge clk); x = 1;  
    @(posedge clk); x = 0;
    @(posedge clk); x = 1;
    @(posedge clk); x = 1;
    @(posedge clk); x = 1;  
    @(posedge clk); x = 0;
    @(posedge clk); x = 1;
    @(posedge clk); x = 1;
    @(posedge clk); x = 0;  

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
