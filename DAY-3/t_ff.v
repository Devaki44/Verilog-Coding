//Design code
module t_ff(t,clk,rst,q,q_bar);
  input wire t,clk,rst;
  output reg q;
  output wire q_bar;
  always@(posedge clk)
    begin
      if(rst)
        q<=1'b0;
      else
        case(t)
        1'b0:q<=q;
        1'b1:q<=~q;
        default:q<=1'b0;
       endcase
    end
 assign q_bar=~q;
endmodule

//Testbench
module t_fftb();
  reg t,clk,rst;
  wire q;
  wire q_bar;
  t_ff uut(.t(t),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    t=0;rst=0;#5;
    t=1;rst=0;#5;
    t=0;rst=1;#5;
    t=1;rst=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("t_ff.vcd");
    $dumpvars(1,t_fftb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|t=%b|q=%b|q_bar=%b",$time,rst,clk,t,q,q_bar);
  end
endmodule
    
