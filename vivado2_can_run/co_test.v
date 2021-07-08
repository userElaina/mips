module test_co;
	reg [31:0] od;

	wire alui;
	wire [5:0] alued;
	// alu

	wire [1:0] regi;
	wire swp12;
	wire [1:0] reg_w;
	wire [4:0] a1;
	wire [4:0] a2;
	wire [4:0] a3;
	// reg

	// wire ext_get;
	wire [31:0] ext;
	// ext

	wire [1:0] pci;
	wire pc_w;
	wire pc_a;
	// ifu

	wire cp0_epc;
	wire cp0_w;
	// cp0

	wire dm_w;
	wire [2:0] dm_type;
	//dm

	co qwq(
		od,
		alui,alued,
		regi,swp12,reg_w,
		a1,a2,a3,
		ext_get,ext,
		pci,pc_w,pc_a,
		cp0_epc,cp0_w,
		dm_w,dm_type
	);

	initial
	begin			
		#20 od=32'h00228021;
		#20 od=32'h00228823;
		#20 od=32'h34320080;
		#20 od=32'h8c330002;
		#20 od=32'hac310002;
		#20 od=32'h3c14abcd;
		#20 od=32'h10210004;
		#20 od=32'hffffffff;
		#20 od=32'h1042ffe0;

		#20 $finish;
	end

endmodule