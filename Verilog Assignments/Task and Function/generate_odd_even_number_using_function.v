//Design code
module odd_even_generator(
  input sel,
  input [3:0]i,
  output reg [3:0]value);
  
  function [3:0]gen_val(
    input s,
    input [3:0]index);
    if(sel==0)
    	gen_val=index*2;
    else
        gen_val=index*2+1;
  endfunction
    
  always@(*)begin
    value=gen_val(sel,i);
  end
  
endmodule


//Testbench
module odd_even_generator_tb;
  reg sel;
  reg [3:0]i;
  wire [3:0]value;
  odd_even_generator dut(sel,i,value);
  initial begin
    sel=0;i=4'b0000;#5;
    i=4'b0001;#5;
    i=4'b0010;#5;
    i=4'b0011;#5;
    i=4'b0100;#5;
  end
  initial begin
    $monitor("$Time=%0t,sel=%b,i=%b,value=%b",$time,sel,i,value);
  end
endmodule
