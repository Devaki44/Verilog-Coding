//Design code
module jk_ff(j,k,clk,rst,q,q_bar);
  input wire j,k,clk,rst;
  output reg q;
  output wire q_bar;
  always@(negedge clk or posedge rst)
    begin
      if(rst)
        q<=1'b0;
      else
        case({j,k})
        2'b00:q<=q;
        2'b01:q<=1'b0;
        2'b10:q<=1'b1;
        2'b11:q<=~q;
        default:q<=1'b0;
       endcase
    end
 assign q_bar=~q;
endmodule
module asyn_up_count(in,clk,rst,q,q_bar);
  input wire in,clk,rst;
  output wire [3:0]q;
  output wire [3:0]q_bar;
  wire x,y,z,w,a,b,c,d;
  jk_ff f1(.j(in),.k(in),.clk(clk),.rst(rst),.q(x),.q_bar(a));
  jk_ff f2(.j(in),.k(in),.clk(x),.rst(rst),.q(y),.q_bar(b));
  jk_ff f3(.j(in),.k(in),.clk(y),.rst(rst),.q(z),.q_bar(c));
  jk_ff f4(.j(in),.k(in),.clk(z),.rst(rst),.q(w),.q_bar(d));
  assign q={w,z,y,x};
  assign q_bar={d,c,b,a};
endmodule


//Testbench
module asyn_up_count_tb();
  reg in,clk,rst;
  wire [3:0]q;
  wire [3:0]q_bar;
  asyn_up_count uut(.in(in),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    in=1'b1;rst=1'b1;#50;
            rst=1'b0;#50;
    #1;$finish;
  end
  initial begin
    $dumpfile("asyn_up_count.vcd");
    $dumpvars(1,asyn_count_up_tb);
  end
  initial begin
    $monitor("Time=%0t|in=%b|clk=%b|rst=%b|q=%b|q_bar=%b",$time,in,clk,rst,q,q_bar);
  end
endmodule
    
  
 
