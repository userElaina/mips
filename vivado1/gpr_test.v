module test_dm;
	reg Regwrite;
	reg Clk;
	reg Reset;
	reg [31:0] Wd;
	reg [4:0] A1;
	reg [4:0] A2;
	reg [4:0] A3;
	wire [31:0] Rd1;
	wire [31:0] Rd2;

	gpr qwq(Regwrite,Clk,Reset,Wd,A1,A2,A3,Rd1,Rd2);

	initial
	begin
		Clk=0;
		Reset=1;
		A1=8;
		A2=9;
		A3=8;
		Wd={16{2'b10}};
		#20 Reset=0;
		#20 
		Regwrite=1;
		#20
		A2=8;
		A1=6;
		#40 $finish;

	end

    always  
        #10 Clk=~Clk;
endmodule






