//Design code(mealy)
module alt_01(clk,rst,x,y);
  input wire x,clk,rst;
  output reg y;
  
  parameter a=2'b00;
  parameter b=2'b01;
  parameter c=2'b10;
  parameter d=2'b11;
  
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
          ns<=c;
        else
          ns<=b;
        end
      c:begin
        if(x==0)
          ns<=a;
        else
          ns<=d;
        end
      d:begin
        if(x==0)
          ns<=c;
        else
          ns<=d;
        end
     
      default:ns<=a;
    endcase
  end
  always @(*) begin
    case (s)
      a: y = 0;
      b: y = (x == 0) ? 1'b1 : 1'b0;
      c: y = (x == 1) ? 1'b1 : 1'b0;
      d: y = 0;
      default: y = 1'b0;
    endcase
   end  
endmodule

//Testbench
module alt_01_tb();
  wire y;
  reg x,rst,clk;
  alt_01 uut(.x(x),.rst(rst),.clk(clk),.y(y));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1'b1;x=1'b0;
    
    @(posedge clk);rst = 0;  x = 0;
    @(posedge clk); x = 1;
    @(posedge clk); x = 0;
    @(posedge clk); x = 1;  
    @(posedge clk); x = 0;
    @(posedge clk); x = 1;
    @(posedge clk); x = 0;
    @(posedge clk); x = 1;  
    @(posedge clk); x = 0;
    @(posedge clk); x = 1;
    @(posedge clk); x = 1;
    @(posedge clk); x = 0;  

    #1;$finish;
  end
  initial begin
    $dumpfile("alt_01.vcd");
    $dumpvars(1,alt_01_tb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|x=%b|y=%b",$time,rst,clk,x,y);
  end
endmodule







