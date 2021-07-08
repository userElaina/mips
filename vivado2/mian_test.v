module test_mian;
	reg clk;
	reg reset;
	wire [31:0] alu_a;
	wire [31:0] alu_b;
	wire [31:0] alu_c;
	wire [31:0] pc;
	wire [31:0] od;

	mian qwq(clk,reset,alu_a,alu_b,alu_c,pc,od);

	initial
	begin
		clk=0;
		reset=0;
		#120 $display("\n");
		reset=1;
		#120 $display("\n");
		reset=0;

		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");

		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");

		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");

		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");

		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");

		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");
		#120 $display("\n");

		#120 $finish;
	end
	
    always  
        #10 clk=~clk;
endmodule