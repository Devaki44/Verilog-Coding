//Design code
module d_lat_2x1mux(d,en,q,q_bar);
  input wire d,en;
  output q;
  output wire q_bar;
  assign q = en ? d:q;
  assign q_bar=~q;
endmodule



//Testbench
module d_lat_tb();
  reg d,en;
  wire q;
  wire q_bar;
  d_lat_2x1mux uut(.d(d),.en(en),.q(q),.q_bar(q_bar));
  initial begin
     en=1'b0;d=0;#5;
     en=1'b0;d=1;#5;
     
     en=1'b1;d=0;#5;
     en=1'b1;d=1;#5;
    
     $finish;
  end
  initial begin
    $dumpfile("d_lat_2x1mux.vcd");
    $dumpvars(1,d_lat_tb);
  end
  initial begin
    $monitor("$Time=%0t|en=%b|d=%b|q=%b|q_bar=%b",$time,en,d,q,q_bar);
  end
endmodule
