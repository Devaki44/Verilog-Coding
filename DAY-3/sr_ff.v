//Design code
module sr_ff(s,r,clk,rst,q,q_bar);
  input wire s,r,clk,rst;
  output reg q;
  output wire q_bar;
  always@(posedge clk)
    begin
      if(rst)
        q<=1'b0;
      else
       case({s,r})
        2'b00:q<=q;
        2'b01:q<=1'b0;
        2'b10:q<=1'b1;
        2'b11:q<=1'bx;
        default:q<=1'b0;
       endcase
    end
 assign q_bar=~q;
endmodule

//Testbench
module sr_fftb();
  reg s,r,clk,rst;
  wire q;
  wire q_bar;
  sr_ff uut(.s(s),.r(r),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    s=0;r=0;rst=0;#5;
    s=0;r=1;rst=0;#5;
    s=1;r=0;rst=0;#5;
    s=1;r=1;rst=0;#5;
    
    s=0;r=0;rst=1;#5;
    s=0;r=1;rst=1;#5;
    s=1;r=0;rst=1;#5;
    s=1;r=1;rst=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("sr_ff.vcd");
    $dumpvars(1,sr_fftb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|s=%b|r=%b|q=%b|q_bar=%b",$time,rst,clk,s,r,q,q_bar);
  end
endmodule
    
