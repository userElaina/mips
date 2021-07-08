module test_gpr;
	reg clk;
	reg reset;
	reg swp12;
	reg [31:0] wd;
	reg [1:0] reg_w;
	reg [4:0] a1;
	reg [4:0] a2;
	reg [4:0] a3;
	wire [31:0] rd1;
	wire [31:0] rd2;

	gpr qwq(clk,reset,swp12,wd,reg_w,a1,a2,a3,rd1,rd2);

	initial
	begin
		clk=0;
		reset=1;
		reg_w=0;
		swp12=0;
		a1=8;
		a2=9;
		a3=8;
		wd={16{2'b10}};
		#20
		reset=0;
		reg_w=3;
		#20
		reg_w=0;
		a2=8;
		a1=6;
		#20
		swp12=1;
		#40 $finish;

	end

    always  
        #2 clk=~clk;
endmodule






