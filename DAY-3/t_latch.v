//Design code
module t_latch(t,en,rst,q,q_bar);
  input wire t,en,rst;
  output reg q;
  output wire q_bar;
  always@(t or en or rst)
    begin
      if(rst)
        q<=1'b0;
      else if(en)
        case(t)
        1'b0:q<=q;
        1'b1:q<=~q;
        default:q<=1'b0;
       endcase
    end
 assign q_bar=~q;
endmodule

//Testbench
module t_lattb();
  reg t,en,rst;
  wire q;
  wire q_bar;
  t_latch uut(.t(t),.en(en),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
     en=1'b0;t=0;rst=0;#5;
     en=1'b0;t=1;rst=0;#5;
     en=1'b0;t=0;rst=1;#5;
     en=1'b0;t=1;rst=1;#5;
   
     en=1'b1;t=0;rst=0;#5;
     en=1'b1;t=1;rst=0;#5;
     en=1'b1;t=0;rst=1;#5;
     en=1'b1;t=1;rst=1;#5;
     $finish;
  end
  initial begin
    $dumpfile("t_latch.vcd");
    $dumpvars(1,t_lattb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|en=%b|t=%b|q=%b|q_bar=%b",$time,rst,en,t,q,q_bar);
  end
endmodule
    
