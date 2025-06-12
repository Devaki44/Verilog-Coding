module mem_8x14;
  reg [13:0]mem[7:0];

  
integer i;
  
 
task fill_ele;
  begin
    for(i=0;i<8;i=i+1)begin
      mem[i]=i+1;
    end
  end
endtask
  initial begin
    fill_ele();
    for(i=0;i<8;i=i+1)begin
       $display("$time=%0t, mem[%0d] = %0d", $time, i, mem[i]);
    end
  end
  
  //clear_memory
  task clr_mem;
    begin
      for (i = 0; i < 8; i = i + 1) begin
        mem[i] = 14'd0;
      end
    end
  endtask
  initial begin
    clr_mem();
    for(i=0;i<8;i=i+1)begin
       $display("$time=%0t, mem[%0d] = %0d", $time, i, mem[i]);
    end
  end
  

endmodule
