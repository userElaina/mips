module mian(
	input wire clk,
	input wire reset,
	output wire [31:0] alu_a,
	output wire [31:0] alu_b,
	output wire [31:0] alu_c,
	output wire [31:0] pc,
	output wire [31:0] od
);
	
	// wire [31:0] od;

	wire alui;
	wire [5:0] alued;
	// alu

	wire [1:0] regi;
	wire ai;
	wire swp12;
	wire [1:0] reg_w;
	wire [4:0] a1;
	wire [4:0] a2;
	wire [4:0] a3;
	// reg

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

	co co1(
		od,
		alui,alued,
		regi,ai,
		swp12,reg_w,
		a1,a2,a3,
		ext,
		pci,pc_w,pc_a,
		cp0_epc,cp0_w,
		dm_w,dm_type
	);


	wire b_succ;
	wire [31:0] ifu_wd;
	// wire [31:0] pc;
	
	ifu ifu1(
		clk,reset,
		pc_w,pc_a,
		b_succ,ifu_wd,
		od,pc
	);
	

	wire [31:0] reg_wd;
	wire [31:0] reg_a2;
	wire [31:0] reg_rd1;
	wire [31:0] reg_rd2;

	gpr gpr1(
		clk,reset,
		swp12,reg_wd,reg_w,
		a1,reg_a2,a3,
		reg_rd1,reg_rd2
	);
	

	// wire [31:0] alu_a;
	// wire [31:0] alu_b;
	// wire [31:0] alu_c;

	alu alu1(clk,alu_a,alu_b,alued,alu_c);


	wire [31:0] dm_wd;
	wire [31:0] dm_a1;
	wire [31:0] dm_rd1;

	dm dm1(clk,reset,dm_w,dm_type,dm_wd,dm_a1,dm_rd1);

	
	wire [31:0] cp0_wd;
	wire [4:0] cp0_a1;
	wire [31:0] cp0_rd1;

	cp0 cp01(clk,reset,cp0_w,cp0_epc,cp0_wd,cp0_a1,cp0_rd1);

	// function call


	parameter pcw_i=2'b00;
	parameter pcw_r=2'b01;//jalr,jr
	parameter pcw_0=2'b10;//eret

	assign b_succ=alu_c;
	assign ifu_wd=pci[1]?pcw_0:(pci[0]?reg_rd1:ext);
	// ifu

	parameter regw_alu=2'b00;
	parameter regw_mem=2'b01;//e_l
	parameter regw_pc4=2'b10;//jal,jalr
	parameter regw_cp0=2'b11;//mfc0

	assign reg_a2={5{ai}}|a2;
	assign reg_wd=regi[1]?(
		regi[0]?cp0_rd1:(pc+4)
	):(
		regi[0]?dm_rd1:alu_c
	);
	//gpr

	assign alu_a=reg_rd1;
	assign alu_b=alui?ext:reg_rd2;
	//alu

	assign dm_wd=reg_rd2;
	assign dm_a1=alu_c;
	// dm

	assign cp0_a1=a3;
	assign cp0_wd=reg_rd1;
	// cp0

endmodule


