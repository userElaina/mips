module test_alu;
	reg [31:0] a;
	reg [31:0] b;
	reg [5:0] ed;
	wire [31:0] c;

	alu qwq(a,b,ed,c);

	parameter ed_add=6'b100000;
	parameter ed_addu=6'b100001;
	parameter ed_sub=6'b100010;
	parameter ed_subu=6'b100011;

	parameter ed_and=6'b100100;
	parameter ed_or=6'b100101;
	parameter ed_xor=6'b100110;
	parameter ed_nor=6'b100111;

	parameter ed_div=6'b011010;
	parameter ed_divu=6'b011011;
	parameter ed_mult=6'b011000;
	parameter ed_multu=6'b011001;

	parameter ed_sll=6'b000000;
	parameter ed_sllv=6'b000100;
	parameter ed_sra=6'b000011;
	parameter ed_srav=6'b000111;
	parameter ed_srl=6'b000010;
	parameter ed_srlv=6'b000110;

	parameter ed_slt=6'b101010;
	parameter ed_sltu=6'b101011;

	parameter ed_mfhi=6'b010000;
	parameter ed_mflo=6'b010010;
	parameter ed_mthi=6'b010001;
	parameter ed_mtlo=6'b010011;

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

	initial
	begin
		#10
		a=-9;
		b=5;

		#10 ed=ed_add;
		#10	ed=ed_sub;

		#10	ed=ed_mult;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;
		#10	ed=ed_multu;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;
		#10	ed=ed_div;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;
		#10	ed=ed_divu;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;

		#10
		a=9;
		b=-5;

		#10 ed=ed_add;
		#10	ed=ed_sub;
		#10	ed=ed_mult;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;
		#10	ed=ed_multu;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;
		#10	ed=ed_div;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;
		#10	ed=ed_divu;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;

		#10
		a=9;
		b=5;

		#10	ed=ed_and;
		#10	ed=ed_or;
		#10	ed=ed_xor;
		#10	ed=ed_nor;

		#10	ed=ed_mthi;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;
		#10	ed=ed_mtlo;
		#10	ed=ed_mfhi;
		#10	ed=ed_mflo;

		#10
		a=42;
		b=2;

		#10 ed=ed_sll;
		#10 ed=ed_sllv;
		#10 ed=ed_sra;
		#10 ed=ed_srav;
		#10 ed=ed_srl;
		#10 ed=ed_srlv;

		#10 ed=ed_slt;
		#10 ed=ed_sltu;

		#10
		a=-10;
		b=1;

		#10 ed=ed_sll;
		#10 ed=ed_sllv;
		#10 ed=ed_sra;
		#10 ed=ed_srav;
		#10 ed=ed_srl;
		#10 ed=ed_srlv;

		#10 ed=ed_slt;
		#10 ed=ed_sltu;

		#10 ed=ex_beq;
		#10 ed=ex_bne;
		#10 ed=ex_bgez;
		#10 ed=ex_bgtz;
		#10 ed=ex_blez;
		#10 ed=ex_bltz;

		#10
		a=0;
		b=0;
		#10 ed=ex_beq;
		#10 ed=ex_bne;
		#10 ed=ex_bgez;
		#10 ed=ex_bgtz;
		#10 ed=ex_blez;
		#10 ed=ex_bltz;

		#10 $finish;

	end
endmodule