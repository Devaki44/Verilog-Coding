//Without decalring the parameter can run in siemens simulator tool

module fifo #(parameter DATA_WIDTH = 3,
              			PTR_WIDTH = 3,
             			DEPTH = 3)(
  input w_clk,w_en,
  input [PTR_WIDTH : 0]w_ptr,
  input r_clk,r_en,
  input [PTR_WIDTH :0]r_ptr,
  input [DATA_WIDTH-1 : 0]data_in,
  input full,empty,
  output reg [DATA_WIDTH-1 : 0]data_out);
  
  reg [DATA_WIDTH-1 : 0]ram[DEPTH-1 :0] ;
  
  always@(posedge w_clk)begin
    if(w_en && !full)begin
      ram[w_ptr[PTR_WIDTH-1:0]] <= data_in;
    end
  end
  
  always@(posedge r_clk)begin
    if(r_en && !empty)begin
      data_out <= ram[r_ptr[PTR_WIDTH-1:0]];
    end
  end
endmodule
  
