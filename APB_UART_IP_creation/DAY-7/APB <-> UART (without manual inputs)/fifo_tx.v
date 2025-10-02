module fifo_tx(
  input clk,
  input rst,
  input w_en,
  input      [7:0]data_in,
  output reg [7:0]data_out,
  output reg f_tx,e_tx);
  
  reg [7:0]mem[0:7];
  reg [3:0]w_ptr,r_ptr;
  
  always@(posedge clk)begin
    if(rst)begin
      data_out     <= 8'b0 ;
      w_ptr	   <= 0;
      r_ptr	   <= 0;
    end
    else begin
      if(w_en && !f_tx)begin
        mem[w_ptr[2:0]]	   <= data_in ;
      	w_ptr 		   <= w_ptr + 1'b1;
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
      if(!w_en && !e_tx)begin
        data_out       	   <= mem[r_ptr[2:0]];
        r_ptr	           <= r_ptr + 1'b1;
      end
    end
  end
  

 // assign full  = ((w_ptr[3] != r_ptr[3]) && (w_ptr[2:0] == r_ptr[2:0])) ? 1 : 0;
  
 // assign empty = (w_ptr == r_ptr) ? 1 : 0;
 
 always@(*)begin
   if((w_ptr[3] != r_ptr[3]) && (w_ptr[2:0] == r_ptr[2:0])) 
	   f_tx = 1'b1 ;
   else
	   f_tx = 1'b0;
 end
 always@(*)begin
   if(w_ptr == r_ptr) 
	   e_tx = 1'b1;
   else
	   e_tx = 1'b0;
 end

endmodule
