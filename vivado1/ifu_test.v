module test_dm;
	reg IfBeq;
	reg Zero;
	reg Clk;
	reg Reset;
	// wire [29:0] a;
	wire [31:0] Instr;

	// ifu qwq(IfBeq,Zero,Clk,Reset,a,Instr);
	// ifu qwq(IfBeq,Zero,Clk,Reset,Instr);

	initial
	begin
		Clk=0;
		Reset=1;
		IfBeq=0;
		Zero=0;
		#20 Reset=0;
		#60 $finish;

	end

    always  
        #10 Clk=~Clk;
endmodule






