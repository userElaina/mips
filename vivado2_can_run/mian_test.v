module test_mian;
	reg clk;
	reg reset;

	mian qwq(clk,reset);

	initial
	begin
		clk=0;
		reset=0;
		#10 $display("\n");
		reset=1;
		#10 $display("\n");
		reset=0;

		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");

		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");

		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");

		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");

		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");

		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");
		#10 $display("\n");

		#10 $finish;
	end
	
    always  
        #1 clk=~clk;
endmodule