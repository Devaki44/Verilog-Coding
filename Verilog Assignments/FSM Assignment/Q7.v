//Given the conditions, such that If A = 0, the circuit oscillates between either one
of the two cases. Case 1: 00-01-00-01... and Case 2: 10-11-10-11... And If A =
1, it switches inter between two cases. write Verilog code

//Design code(moore)
module cir_os(clk,rst,x,y);
  input wire x,clk,rst;
  output reg y;
  
  parameter a=2'b00;
  parameter b=2'b01;
  parameter c=2'b10;
  parameter d=2'b11;
  
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
          ns<=b;
        else
          ns<=c;
        end
      b:begin
        if(x==0)
          ns<=a;
        else
          ns<=d;
        end
      c:begin
        if(x==0)
          ns<=d;
        else
          ns<=a;
        end
      d:begin
        if(x==0)
          ns<=c;
        else
          ns<=b;
        end
      default:ns<=a;
    endcase
  end
  always@(*)begin
    case(s)
      a:y=(x==1)?1:0;
      b:y=(x==0)?1:0;
      c:y=(x==0)?1:0;
      d:y=(x==1)?1:0;
    endcase
  end
endmodule
      
      


//Testbench
module cir_os(clk,rst,x,y);
  input wire x,clk,rst;
  output reg y;
  
  parameter a=2'b00;
  parameter b=2'b01;
  parameter c=2'b10;
  parameter d=2'b11;
  
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
          ns<=b;
        else
          ns<=c;
        end
      b:begin
        if(x==0)
          ns<=a;
        else
          ns<=d;
        end
      c:begin
        if(x==0)
          ns<=d;
        else
          ns<=a;
        end
      d:begin
        if(x==0)
          ns<=c;
        else
          ns<=b;
        end
      default:ns<=a;
    endcase
  end
  always@(*)begin
    case(s)
      a:y=(x==1)?1:0;
      b:y=(x==0)?1:0;
      c:y=(x==0)?1:0;
      d:y=(x==1)?1:0;
    endcase
  end
endmodule
      
      
      
