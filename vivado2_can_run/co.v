module co(
	input wire [31:0] od,

	output wire alui,
	// mian alu
	output wire [5:0] alued,
	// alu

	output wire [1:0] regi,
	output wire ai,
	// mian reg
	output wire swp12,
	output wire [1:0] reg_w,
	output wire [4:0] a1,
	output wire [4:0] a2,
	output wire [4:0] a3,
	// reg

	// output wire ext_get,
	output wire [31:0] ext,
	// ext

	output wire [1:0] pci,
	// mian ifu
	output wire pc_w,
	output wire pc_a,
	// ifu

	output wire cp0_epc,
	output wire cp0_w,
	// cp0

	output wire dm_w,
	output wire [2:0] dm_type
	// dm


	// output wire Regdst,
	// output wire Alusrc,
	// output wire Memtoreg,
	// output wire Memwrite,
	// output wire npc_sel
);

	parameter op1=6'b000000;
	parameter ed_add=6'b100000;
	parameter ed_addu=6'b100001;
	parameter ed_sub=6'b100010;
	parameter ed_subu=6'b100011;

	parameter ed_and=6'b100100;
	parameter ed_or=6'b100101;
	parameter ed_xor=6'b100110;
	parameter ed_nor=6'b100111;

	parameter ed_sll=6'b000000;
	parameter ed_sllv=6'b000100;
	parameter ed_sra=6'b000011;
	parameter ed_srav=6'b000111;
	parameter ed_srl=6'b000010;
	parameter ed_srlv=6'b000110;

	parameter ed_slt=6'b101010;
	parameter ed_sltu=6'b101011;

	parameter ed_div=6'b011010;
	parameter ed_divu=6'b011011;
	parameter ed_mult=6'b011000;
	parameter ed_multu=6'b011001;
	
	parameter ed_break=6'b001101;
	parameter ed_syscall=6'b001100;

	parameter ed_jalr=6'b001001;
	parameter ed_jr=6'b001000;

	parameter ed_mfhi=6'b010000;
	parameter ed_mflo=6'b010010;
	parameter ed_mthi=6'b010001;
	parameter ed_mtlo=6'b010011;

	parameter aed_ls=6'b111110;
	parameter aed_b=6'b111111;


	parameter op2=6'b010000;
	parameter ed_eret=6'b011000;
	parameter a1_mfc0=5'b00000;
	parameter a1_mtc0=5'b00100;

	parameter op3=6'b000001;
	parameter a2_bgez=5'b00001;
	parameter a2_bltz=5'b00000;

	parameter op_addi=6'b001000;
	parameter op_addiu=6'b001001;
	parameter op_andi=6'b001100;
	parameter op_ori=6'b001101;
	parameter op_xori=6'b001110;

	parameter op_beq=6'b000100;
	parameter op_bgtz=6'b000111;
	parameter op_blez=6'b000110;
	parameter op_bne=6'b000101;
	
	parameter op_j=6'b000010;
	parameter op_jal=6'b000011;

	parameter op_lb=6'b100000;
	parameter op_lbu=6'b100100;
	parameter op_lh=6'b100001;
	parameter op_lhu=6'b100101;
	parameter op_lw=6'b100011;
	
	parameter op_lui=6'b001111;

	parameter op_sb=6'b101000;
	parameter op_sh=6'b101001;
	parameter op_sw=6'b101001;

	parameter op_slti=6'b001010;
	parameter op_sltiu=6'b001011;
	
	// mips doc

	wire [5:0] op;
	wire [5:0] ed;
	wire [4:0] a4;
	wire [15:0] a16;
	wire [25:0] a26;
	assign op=od[31:26];
	assign ed=od[5:0];
	assign a1=od[25:21];
	assign a2=od[20:16];
	assign a3=od[15:11];
	assign a4=od[10:6];
	assign a16=od[15:0];
	assign a26=od[25:0];

	// split

	wire co_add=(op==op1)&&(ed==ed_add);
	wire co_addu=(op==op1)&&(ed==ed_addu);
	wire co_sub=(op==op1)&&(ed==ed_sub);
	wire co_subu=(op==op1)&&(ed==ed_subu);
	wire co_and=(op==op1)&&(ed==ed_and);
	wire co_or=(op==op1)&&(ed==ed_or);
	wire co_xor=(op==op1)&&(ed==ed_xor);
	wire co_nor=(op==op1)&&(ed==ed_nor);
	wire co_sll=(op==op1)&&(ed==ed_sll);
	wire co_sllv=(op==op1)&&(ed==ed_sllv);
	wire co_sra=(op==op1)&&(ed==ed_sra);
	wire co_srav=(op==op1)&&(ed==ed_srav);
	wire co_srl=(op==op1)&&(ed==ed_srl);
	wire co_srlv=(op==op1)&&(ed==ed_srlv);
	wire co_slt=(op==op1)&&(ed==ed_slt);
	wire co_sltu=(op==op1)&&(ed==ed_sltu);
	wire co_div=(op==op1)&&(ed==ed_div);
	wire co_divu=(op==op1)&&(ed==ed_divu);
	wire co_mult=(op==op1)&&(ed==ed_mult);
	wire co_multu=(op==op1)&&(ed==ed_multu);
	wire co_break=(op==op1)&&(ed==ed_break);
	wire co_syscall=(op==op1)&&(ed==ed_syscall);
	wire co_jalr=(op==op1)&&(ed==ed_jalr);
	wire co_jr=(op==op1)&&(ed==ed_jr);
	wire co_mfhi=(op==op1)&&(ed==ed_mfhi);
	wire co_mflo=(op==op1)&&(ed==ed_mflo);
	wire co_mthi=(op==op1)&&(ed==ed_mthi);
	wire co_mtlo=(op==op1)&&(ed==ed_mtlo);

	wire co_eret=(op==op2)&&(ed==ed_eret);
	wire co_mfc0=(op==op2)&&(a1==a1_mfc0);
	wire co_mtc0=(op==op2)&&(a1==a1_mtc0);

	wire co_bgez=(op==op3)&&(a2==a2_bgez);
	wire co_bltz=(op==op3)&&(a2==a2_bltz);
	
	wire co_addi=(op==op_addi);
	wire co_addiu=(op==op_addiu);
	wire co_andi=(op==op_andi);
	wire co_ori=(op==op_ori);
	wire co_xori=(op==op_xori);
	wire co_beq=(op==op_beq);
	wire co_bgtz=(op==op_bgtz);
	wire co_blez=(op==op_blez);
	wire co_bne=(op==op_bne);
	wire co_j=(op==op_j);
	wire co_jal=(op==op_jal);
	wire co_lb=(op==op_lb);
	wire co_lbu=(op==op_lbu);
	wire co_lh=(op==op_lh);
	wire co_lhu=(op==op_lhu);
	wire co_lw=(op==op_lw);
	wire co_lui=(op==op_lui);
	wire co_sb=(op==op_sb);
	wire co_sh=(op==op_sh);
	wire co_sw=(op==op_sw);
	wire co_slti=(op==op_slti);
	wire co_sltiu=(op==op_sltiu);

	// get title

	wire e_l=co_lb|co_lbu|co_lh|co_lhu|co_lw;
	wire e_s=co_sb|co_sh|co_sw;
	wire e_b1=co_beq|co_bne;
	wire e_b2=co_bgez|co_bgtz|co_blez|co_bltz;
	wire e_b=e_b1|e_b2;
	wire e_j=co_j|co_jr|co_jal|co_jalr;
	wire e_wt=co_break|co_syscall;

	wire e_add=co_addi|co_addiu|e_l|e_s;
	wire e_sub=0;
	wire e_and=co_andi;
	wire e_or=co_ori;
	wire e_xor=co_xori;
	wire e_slt=co_slti|co_sltiu;
	wire e_none=co_eret|co_mfc0|co_mtc0|e_j|e_wt|co_lui;

	wire e_i=co_addi|co_addiu|co_andi|co_ori|co_xori|co_slti|co_sltiu;
	// classify

	parameter ex_add=6'b110000;
	parameter ex_sub=6'b110001;
	parameter ex_and=6'b110010;
	parameter ex_or=6'b110011;
	parameter ex_xor=6'b110100;
	parameter ex_slt=6'b110101;

	parameter ex_a=6'b110110;
	parameter ex_b=6'b110111;

	parameter ex_bltz=6'b111000;
	parameter ex_bgez=6'b111001;
	parameter ex_beq=6'b111100;
	parameter ex_bne=6'b111101;
	parameter ex_blez=6'b111110;
	parameter ex_bgtz=6'b111111;

	// ex alu olders

	wire [5:0] alued1;
	wire [5:0] alued2;
	assign alued1=co_bltz?ex_bltz:(
		co_bgez?ex_bgez:(
			co_beq?ex_beq:(
				co_bne?ex_bne:(
					co_blez?ex_blez:(
						co_bgtz?ex_bgtz:ed
					)
				)
			)
		)
	);
	assign alued2=e_add?ex_add:(
		e_sub?ex_sub:(
			e_and?ex_and:(
				e_or?ex_or:(
					e_xor?ex_xor:(
						e_slt?ex_slt:alued2
					)
				)
			)
		)
	);
	assign alued=e_none?ex_b:alued2;
	assign alui=e_i|e_l|e_s|co_sll|co_sra|co_srl|co_lui;
	// alu op


	assign reg_rrx=co_div|co_divu|co_mult|co_multu|e_b1|e_s;
	assign reg_rxx=co_mthi|co_mtlo|co_jr|e_b2;
	assign reg_xrx=co_mtc0;

	assign reg_rrw=co_add|co_addu|co_sub|co_subu|co_and|co_nor|co_or|co_xor|co_slt|co_sltu|co_sllv|co_srav|co_srlv;
	assign reg_rxw=co_jalr;
	assign reg_xrw=co_sll|co_sra|co_srl;
	assign reg_xxw=co_mfhi|co_mflo;
	assign reg_rwx=e_i|e_l;
	assign reg_xwx=co_lui|co_mfc0;

	assign swp12=reg_xrx|reg_xrw;
	assign reg_w2=reg_rwx|reg_xwx;
	assign reg_w3=reg_rrw|reg_rxw|reg_xrw|reg_xxw;

	assign reg_w=reg_w2?2:(reg_w3?3:0);
	// reg write 

	parameter regw_alu=2'b00;
	parameter regw_mem=2'b01;//e_l
	parameter regw_pc4=2'b10;//jal,jalr
	parameter regw_cp0=2'b11;//mfc0

	assign regi=co_mfc0?regw_cp0:(
		e_j?regw_pc4:(
			e_l?regw_mem:regw_alu
		)
	);
	assign ai=co_jal;
	// reg op 

	wire i_ext16;
	wire op_ext16;
	wire op_ext5;
	wire op_ext26;
	assign i_ext16=co_addiu|co_sltiu;
	assign op_ext16=e_s|e_l|e_i|e_b|co_lui;
	assign op_ext5=reg_xrw;
	assign op_ext26=co_j|co_jal;
	// ext op
	
	// assign ext_get=op_ext16|op_ext26|op_ext5;
	assign ext=op_ext5?{{27{1'b0}},a4}:(
		op_ext26?{{6{1'b0}},a26}:(
			i_ext16?{
				{16{a16[15]}},a16
			}:{
				{16{1'b0}},a16
			}
		)
	);
	// ext directly


	parameter pcw_i=2'b00;
	parameter pcw_r=2'b01;//jalr,jr
	parameter pcw_0=2'b10;//eret
	assign pci={co_eret,co_jalr|co_jr};

	assign pc_w=co_mtc0|co_eret|e_j;
	assign pc_a=e_b;
	// ifu op

	assign cp0_epc=co_eret;
	assign cp0_w=co_mtc0;
	// cp0 op

	parameter dmt_w=3'b000;
	parameter dmt_h=3'b100;
	parameter dmt_hu=3'b101;
	parameter dmt_b=3'b110;
	parameter dmt_bu=3'b111;
	// dm data types

	assign dm_w=e_s;
	assign dm_type={
		~(co_sw|co_lw),
		co_lb|co_lbu|co_sb,
		co_lbu|co_lhu
	};
	// dm op

	// assign Regdst=addu|subu|sw;
	// assign Alusrc=ori|lw|sw;
	// assign Memtoreg=lw|lui;
	// assign Regwrite=addu|subu|ori|lw|lui;
	// assign Memwrite=sw;
	// assign npc_sel=beq;

endmodule