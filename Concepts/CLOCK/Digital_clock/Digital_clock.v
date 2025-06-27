module digital_clk(
  input clk,
  input rst,
  output reg [5:0]seconds,
  output reg [5:0]minutes,
  output reg [4:0]hours
);
  always@(posedge clk)begin
    if(rst)begin
      seconds <= 0 ;
      minutes <= 0 ;
      hours   <= 0 ;
    end
    else begin
      if(seconds == 59)begin
        seconds <= 0 ;
        if(minutes == 59)begin
          minutes <= 0 ;
          if(hours == 23)begin
            hours <= 0;
          end
          
          else begin
            hours <= hours+1 ;
          end
        end
        else begin
          minutes <= minutes+1;
        end
      end
      else begin
        seconds <= seconds+1 ;
      end
    end
  end     
endmodule
        
