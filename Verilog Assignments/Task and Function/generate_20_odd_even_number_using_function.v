//Design code
module odd_even_generator(
  input sel,
  input [7:0]i,
  output reg [7:0]value);
  
  function [7:0]gen_val(
    input s,
    input [7:0]index);
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
  reg [7:0]i;
  wire [7:0]value;
  odd_even_generator dut(sel,i,value);
 
 
  initial begin
    sel = 0;
    for(i=0;i<19;i=i+1)begin#5;
    end
  end
  initial begin
    $monitor("$Time=%0t,sel=%b,i=%d,value=%d",$time,sel,i,value);
  end
endmodule
  
  
