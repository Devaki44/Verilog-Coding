module baud_gen(
  input clk,
  input rst,
  output reg baud_tick);
  
  parameter FRE 	  = 50_000_000;
  parameter BAUD_RATE = 9600 ;
  parameter COUNT_MAX = FRE / BAUD_RATE ;
  
  reg [13 : 0]count ;
  
  always@(posedge clk)begin
    if(rst)begin
      baud_tick <= 0;
      count     <= 0;
    end
    else begin
      if(count == COUNT_MAX - 1)begin
        baud_tick <= 1 ;
        count	  <= 0 ;
      end
      else begin
        baud_tick <= 0;
        count     <= count + 1;
      end
    end
  end
endmodule
