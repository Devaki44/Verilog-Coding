//Design code
module tff(t,clk,rst,q,q_bar);
  input wire t,clk,rst;
  output reg q;
  output wire q_bar;
  always@(posedge clk or posedge rst)
   begin
    if(rst)
      q<=1'b0;
    else
      begin
        case(t)
          1'b0:q<=q;
          1'b1:q<=~q;
        endcase
      end
   end
  assign q_bar=~q;
endmodule

//Testbench
module tff_tb;
  reg t,clk,rst;
  wire q,q_bar;
  tff uut(.t(t),
          .clk(clk),
          .rst(rst),
          .q(q),
          .q_bar(q_bar));
  initial begin
      clk=0;
      forever #5 clk=~clk;
  end
  initial begin
      rst=1;t=0;#5;
      rst=1;t=1;#5;
      rst=0;t=0;#5;
      rst=0;t=1;#5;
      #1;$finish;
  end
  initial begin
      $dumpfile("tff_tb.vcd");
      $dumpvars(0,tff_tb);
  end
  initial begin
    $monitor("Time=%0d | rst=%b  | clk=%b | t=%b | q=%b | q_bar=%b",$time,t,rst,clk,q,q_bar);
  end
endmodule  
