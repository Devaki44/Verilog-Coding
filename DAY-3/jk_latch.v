//Design code
module jk_latch(j,k,en,rst,q,q_bar);
  input wire j,k,en,rst;
  output reg q;
  output wire q_bar;
  always@(j,k,en,rst)
    begin
      if(rst)
        q<=1'b0;
      else if(en)
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

//Testbench
module jk_lattb();
  reg j,k,en,rst;
  wire q;
  wire q_bar;
  jk_latch uut(.j(j),.k(k),.en(en),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
    en=0;j=0;k=0;rst=0;#5;
    en=0;j=0;k=1;rst=0;#5;
    en=1;j=1;k=0;rst=0;#5;
    en=1;j=1;k=1;rst=0;#5;
    
    en=0;j=0;k=0;rst=1;#5;
    en=0;j=0;k=1;rst=1;#5;
    en=1;j=1;k=0;rst=1;#5;
    en=1;j=1;k=1;rst=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("jk_latch.vcd");
    $dumpvars(1,jk_lattb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|en=%b|j=%b|k=%b|q=%b|q_bar=%b",$time,rst,en,j,k,q,q_bar);
  end
endmodule
    
