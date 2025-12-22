module  simple_dpram(
  input clk1,clk2,
  input rst1,rst2,
  input w_en,
  input r_en,
  input [1:0]addr1,
  input [1:0]addr2,
  input [7:0]data_in2,
  output reg [7:0]data_out1);  
  reg [7:0]dpram[0:3];
  
  always@(posedge clk1)begin
    if(rst1)
      data_out1 <= 0;
    else if(r_en)
      data_out1 <= dpram[addr1];
  end
  always@(posedge clk2)begin
    if(rst2)
      dpram[addr2] <= 0;

    else if(w_en)
      dpram[addr2] <= data_in2;
      
  end
endmodule
      
      
