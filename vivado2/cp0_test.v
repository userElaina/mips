module test_cp0;
	reg clk;
	reg reset;
	reg cp0_w;
	reg cp0_epc;
	reg [31:0] wd;
	reg [4:0] a1;
	wire [31:0] rd1;

	cp0 qwq(clk,reset,cp0_w,cp0_epc,wd,a1,rd1);

	initial
	begin
		clk=0;
		reset=1;
		a1=4;
		wd={16{2'b10}};
		cp0_epc=0;
		cp0_w=0;
		#50 reset=0;
		#50 cp0_w=1;
		#50 cp0_w=0;
		cp0_epc=1;
		#50 cp0_epc=0;
		#100 $finish;

	end

    always  
        #5 clk=~clk;
endmodule






