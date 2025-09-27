module fifo_rx(
  input clk,
  input rst,
  input w_en_rx,
  input      [7:0]data_in,
  output reg [7:0]data_out,
  output reg f_rx,e_rx);
  
  reg [7:0]mem[2:0];
  reg [3:0]w_ptr,r_ptr;
  reg w_r,w_en_rx_d;
  
  always@(posedge clk)begin
    if(rst)begin
      data_out	   <= 8'b0 ;
      w_ptr	   <= 0;
      r_ptr	   <= 0;
    end
    else begin
      if(w_r && !f_rx)begin
        mem[w_ptr[2:0]]	    <= data_in ;
      	w_ptr 	            <= w_ptr + 1'b1;
      end
    end
  end
  
  always@(posedge clk)begin
    if(rst)begin
      data_out <= 8'b0 ;
      w_ptr    <= 0;
      r_ptr    <= 0;
    end
    else begin
      if(!w_r && !e_rx)begin
        data_out	<= mem[r_ptr[2:0]];
        r_ptr		<= r_ptr + 1'b1;
      end
    end
  end
  
 //assign f_rx  = (w_ptr[3] != r_ptr[3]) && (w_ptr[2:0] == r_ptr[2:0]);
 //assign e_rx = (w_ptr == r_ptr);
 
  always@(*)begin
   if((w_ptr[3] != r_ptr[3]) && (w_ptr[2:0] == r_ptr[2:0])) 
	   f_rx = 1'b1 ;
   else
	   f_rx = 1'b0;
 end
 always@(*)begin
   if(w_ptr == r_ptr) 
	   e_rx = 1'b1;
   else
	   e_rx = 1'b0;
 end

 //posedge detection
 always@(posedge clk)begin
   w_en_rx_d	<= w_en_rx ;
   w_r		<= w_en_rx & ~w_en_rx_d;
 end


endmodule
