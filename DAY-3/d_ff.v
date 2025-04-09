//Design code
module d_ff(d,clk,rst,q,q_bar);
  input wire d,clk,rst;
  output reg q;
  output wire q_bar;
  always@(posedge clk)
    begin
      if(rst)
        q<=1'b0;
      else
        case(d)
        1'b0:q<=1'b0;
        1'b1:q<=1'b1;
        default:q<=1'b0;
       endcase
    end
 assign q_bar=~q;
endmodule

//Testbench
module d_fftb();
  reg d,clk,rst;
  wire q;
  wire q_bar;
  d_ff uut(.d(d),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    d=0;rst=0;#5;
    d=1;rst=0;#5;
    d=0;rst=1;#5;
    d=1;rst=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("d_ff.vcd");
    $dumpvars(1,d_fftb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|d=%b|q=%b|q_bar=%b",$time,rst,clk,d,q,q_bar);
  end
endmodule
    
