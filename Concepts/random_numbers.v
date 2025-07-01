module rand_no;
	integer i;
	integer random_numbers;

initial begin
	for(i=0;i<20;i=i+1)begin
		random_numbers = $urandom_range(0,200) - 100 ;
		$display("$time=%0t,i=%0d,random_numbers=%0d",$time,i,random_numbers);
	end
end
endmodule
