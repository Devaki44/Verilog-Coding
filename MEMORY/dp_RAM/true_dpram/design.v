module true_dpram(
  input clk1,clk2,
  input rst1,rst2,
  input en1,en2,
  input [1:0]addr1,addr2,
  input [7:0]data_in1,data_in2,
  output reg [7:0]data_out1,data_out2);
  
  reg[7:0]dpram[0:2];
  
  //port1
  always@(posedge clk1)begin
    if(rst1)
      data_out1 <= 8'b0;
    else begin
      if(en1)
        dpram[addr1] <= data_in1 ;
      else
        data_out1	 <= dpram[addr1];
    end
  end
  
  //port2
  always@(posedge clk2)begin
    if(rst2)
      data_out2 <= 8'b0;
    else begin
      if(en2)
        dpram[addr2] <= data_in2 ;
      else
        data_out2	 <= dpram[addr2];
    end
  end
endmodule
      




