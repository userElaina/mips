module mian(
	input wire Clk,
	input wire ifu_Reset,
	input wire Reset
	// output wire [31:0] Rd1,
	// output wire [31:0] alu_B,
	// output wire [31:0] alu_C,
	// output wire [5:0] o,
	// output wire [5:0] f
);
	
	wire [5:0] o;
	wire [5:0] f;
	wire Regdst;
	wire Alusrc;
	wire Memtoreg;
	wire Regwrite;
	wire Memwrite;
	wire npc_sel;
	wire Extop;
	wire [1:0] Aluop;

	// wire IfBeq;
	wire Zero;
	// wire Clk;
	// wire ifu_Reset;
	wire [31:0] Instr;

	wire [31:0] Wd;
	wire [4:0] A1;
	wire [4:0] A2;
	wire [4:0] A3;
	wire [31:0] Rd1;
	wire [31:0] Rd2;
	// wire Reset;
	
	// wire [31:0] D;
	wire dm_Memtoreg;
	// wire Memwrite;
	// wire Clk;
	// wire Reset;
	wire [4:0] A;
	wire [31:0] out_DM;

	// wire [31:0] alu_A;
	wire [31:0] alu_B;
	// wire [1:0] Aluop;
	wire [31:0] alu_C;

	wire [15:0] ext_A;
	// wire Extop;
	wire [31:0] ext_B;
	
	co co1(o,f,Regdst,Alusrc,Memtoreg,Regwrite,Memwrite,npc_sel,Extop,Aluop);
	ifu ifu1(npc_sel,Zero,Clk,ifu_Reset,Instr);
	gprs gpr1(Regwrite,Clk,Reset,Wd,A1,A2,A3,Rd1,Rd2);
	dm dm1(Rd2,dm_Memtoreg,Memwrite,Clk,Reset,A,out_DM);
	alu alu1(Rd1,alu_B,Aluop,alu_C);
	ext ext1(ext_A,Extop,ext_B);

	assign o=Instr[31:26];
	assign f=Instr[5:0];

	assign Zero=(alu_C==0);

	assign Wd=Memtoreg?(Alusrc?out_DM:ext_B):alu_C;
	assign A1=Instr[25:21];
	assign A2=Instr[20:16];
	assign A3=Regdst?Instr[15:11]:Instr[20:16];

	assign dm_Memtoreg=~Memwrite;
	assign A=alu_C[4:0];

	assign alu_B=Alusrc?ext_B:Rd2;
	
	assign ext_A=Instr[15:0];

endmodule


