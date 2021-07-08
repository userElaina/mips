module test_dm;
	reg clk;
	reg reset;
	reg dm_w;
	reg [2:0] dm_type;
	reg [31:0] wd;
	reg [31:0] a1;
	wire [31:0] rd1;

	dm qwq(clk,reset,dm_w,dm_type,wd,a1,rd1);

	parameter dmt_w=3'b000;
	parameter dmt_h=3'b100;
	parameter dmt_hu=3'b101;
	parameter dmt_b=3'b110;
	parameter dmt_bu=3'b111;

	initial
	begin
		clk=0;
		reset=1;
		dm_w=0;
		dm_type=dmt_w;
		wd={16{2'b10}};
		a1=1;
		#10 
		reset=0;
		dm_w=1;
		#10
		dm_type=dmt_h;
		a1=10;
		#10
		dm_type=dmt_b;
		a1=15;
		#10
		dm_w=0;
		a1=1;
		dm_type=dmt_w;
		#10
		a1=2;
		#10
		a1=3;
		#10 
		a1=4;
		#10 
		a1=5;
		#10 
		dm_type=dmt_h;
		a1=6;
		#10
		dm_type=dmt_hu;
		#10
		dm_type=dmt_b;
		a1=5;
		#10
		dm_type=dmt_bu;
		#20 $finish;
	end

    always  
        #1 clk=~clk;
endmodule
