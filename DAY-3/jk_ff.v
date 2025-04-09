//Design code
module jk_ff(j,k,clk,rst,q,q_bar);
  input wire j,k,clk,rst;
  output reg q;
  output wire q_bar;
  always@(posedge clk)
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

//Testbench
module jk_fftb();
  reg j,k,clk,rst;
  wire q;
  wire q_bar;
  jk_ff uut(.j(j),.k(k),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    j=0;k=0;rst=0;#5;
    j=0;k=1;rst=0;#5;
    j=1;k=0;rst=0;#5;
    j=1;k=1;rst=0;#5;
   
    j=0;k=0;rst=1;#5;
    j=0;k=1;rst=1;#5;
    j=1;k=0;rst=1;#5;
    j=1;k=1;rst=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("jk_ff.vcd");
    $dumpvars(1,jk_fftb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|j=%b|k=%b|q=%b|q_bar=%b",$time,rst,clk,j,k,q,q_bar);
  end
endmodule
