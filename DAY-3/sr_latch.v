//Design code
module sr_latch(s,r,en,rst,q,q_bar);
  input wire s,r,en,rst;
  output reg q;
  output wire q_bar;
  always@(s,r,en,rst)
    begin
      if(rst)
        q<=1'b0;
      else if(en)
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
module sr_lattb();
  reg s,r,en,rst;
  wire q;
  wire q_bar;
  sr_latch uut(.s(s),.r(r),.en(en),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
    en=0;s=0;r=0;rst=0;#5;
    en=0;s=0;r=1;rst=0;#5;
    en=1;s=1;r=0;rst=0;#5;
    en=1;s=1;r=1;rst=0;#5;
    
    en=0;s=0;r=0;rst=1;#5;
    en=0;s=0;r=1;rst=1;#5;
    en=1;s=1;r=0;rst=1;#5;
    en=1;s=1;r=1;rst=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("sr_latch.vcd");
    $dumpvars(1,sr_lattb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|en=%b|s=%b|r=%b|q=%b|q_bar=%b",$time,rst,en,s,r,q,q_bar);
  end
endmodule
