module test_ifu;
	reg clk;
	reg reset;
	reg pc_w;
	reg pc_a;
	reg b_succ;
	reg [31:0] wd;
	wire [31:0] od;
	wire [31:0] pc;

	ifu qwq(clk,reset,pc_w,pc_a,b_succ,wd,od,pc);

	initial
	begin
		clk=0;
		reset=1;
		pc_w=0;
		pc_a=0;
		b_succ=0;
		wd=2;
		#100 reset=0;
		#200
		pc_a=1;
		b_succ=1;
		#100
		pc_a=0;
		#200
		wd=8;
		pc_w=1;
		#200 $finish;

	end

    always  
        #10 clk=~clk;
endmodule






