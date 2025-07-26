//DESIGN CODE
module fifo(
  input clk,
  input rst,
  input w_en,
  input [7:0]data_in,
  output reg [7:0]data_out,
  output full,empty);
  
  reg [7:0]fifo[0:255] ;
  reg [3:0]w_ptr,r_ptr;
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      w_ptr    <=   0 ;
      r_ptr    <=   0 ;
      data_out <= 8'b0 ;
    end
    else if(w_en && !full)begin
      fifo[w_ptr]	<= data_in ;
      w_ptr			<= w_ptr + 1'b1 ;
    end
    else if(!w_en && !empty)begin
      data_out 		<= fifo[r_ptr] ;
      r_ptr			<= r_ptr + 1'b1 ;
    end
  end
  
  assign full  = (w_ptr + 1'b1 == r_ptr);
  assign empty = (w_ptr == r_ptr);

endmodule
