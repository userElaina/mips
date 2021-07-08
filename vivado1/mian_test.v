module test_mian;
	reg Clk;
	reg ifu_Reset;
	reg Reset;
	// wire [31:0] Rd1;
	// wire [31:0] alu_B;
	// wire [31:0] alu_C;
	// wire [5:0] o;
	// wire [5:0] f;

	// mian qwq(Clk,ifu_Reset,Reset,Rd1,alu_B,alu_C,o,f);
	mian qwq(Clk,ifu_Reset,Reset);

	initial
	begin
		Clk=0;
		ifu_Reset=0;
		Reset=0;
		#10 $display("\n");
		Reset=1;
		ifu_Reset=1;
		#10 $display("\n");
		Reset=0;
		ifu_Reset=0;

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
        #5 Clk=~Clk;
endmodule