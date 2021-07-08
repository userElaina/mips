module alu(
	input wire [31:0] a,
	input wire [31:0] b,
	input wire [5:0] ed,
	output reg [31:0] c
);

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


	reg [31:0] hi;
	reg [31:0] lo;
	reg [63:0] aa;
	reg [63:0] bb;
	reg [63:0] cc;
	reg flg_div_a;
	reg flg_div_b;
	parameter _zero={32{1'b0}};
	integer i;
	integer INT_MAX=2147483647;


	always @(*)
	begin
		case(ed)
			ed_add:
			begin
				c=a+b;
				$display("alu:add\n%d+%d=%d",a,b,c);
			end
			ed_addu:
			begin
				c=a+b;
				$display("alu:addu\n%d+%d=%d",a,b,c);
			end
			ex_add:
			begin
				c=a+b;
				$display("alu:ex_add\n%d+%d=%d",a,b,c);
			end
			ed_sub:
			begin
				c=a-b;
				$display("alu:sub\n%d-%d=%d",a,b,c);
			end
			ed_subu:
			begin
				c=a-b;
				$display("alu:subu\n%d-%d=%d",a,b,c);
			end
			ex_sub:
			begin
				c=a-b;
				$display("alu:ex_sub\n%d-%d=%d",a,b,c);
			end

			ed_and:
			begin
				c=a&b;
				$display("alu:and\n%d&%d=%d",a,b,c);
			end
			ex_and:
			begin
				c=a&b;
				$display("alu:ex_and\n%d&%d=%d",a,b,c);
			end
			ed_or:
			begin
				c=a|b;
				$display("alu:or\n%d|%d=%d",a,b,c);
			end
			ex_or:
			begin
				c=a|b;
				$display("alu:ex_or\n%d|%d=%d",a,b,c);
			end
			ed_xor:
			begin
				c=a^b;
				$display("alu:xor\n%d^%d=%d",a,b,c);
			end
			ex_xor:
			begin
				c=a^b;
				$display("alu:ex_xor\n%d^%d=%d",a,b,c);
			end
			ed_nor:
			begin
				c=~(a|b);
				$display("alu:nor\n%d,%d=%d",a,b,c);
			end

			ed_div:
			begin
				if(a>INT_MAX)
				begin
					aa={_zero,~a+1};
					flg_div_a=1;
				end
				else
				begin
					aa={_zero,a};
					flg_div_a=0;
				end

				if(b>INT_MAX)
				begin
					bb={_zero,~b+1};
					flg_div_b=~flg_div_a;
				end
				else
				begin
					bb={_zero,b};
					flg_div_b=flg_div_a;
				end
				
				cc=aa%bb;
				if(flg_div_a&&(cc!=0))
				begin
					cc=bb-cc;
					flg_div_a=1;
				end
				else
					flg_div_a=0;
				lo=cc[31:0];

				cc=aa/bb;
				if(flg_div_a)
					cc=cc+1;
				if(flg_div_b)
					cc=~cc+1;
				hi=cc[31:0];

				$display("alu:div\n%d/%d=%d^%d",a,b,hi,lo);
			end
			ed_divu:
			begin
				aa={_zero,a};
				bb={_zero,b};
				cc=aa/bb;
				hi=cc[31:0];
				cc=aa%bb;
				lo=cc[31:0];
				$display("alu:divu\n%d/%d=%d^%d",a,b,hi,lo);
			end
			ed_mult:
			begin
				aa={{32{a[31]}},a};
				bb={{32{b[31]}},b};
				cc=aa*bb;
				hi=cc[63:32];
				lo=cc[31:0];
				$display("alu:mult\n%d*%d=%d,%d",a,b,hi,lo);
			end
			ed_multu:
			begin
				aa={_zero,a};
				bb={_zero,b};
				cc=aa*bb;
				hi=cc[63:32];
				lo=cc[31:0];
				$display("alu:multu\n%d*%d=%d,%d",a,b,hi,lo);
			end

			ed_sll:
			begin
				c=a<<b;
				$display("alu:sll\n%d<<%d=%d",a,b,c);
			end
			ed_sllv:
			begin
				c=a<<b;
				$display("alu:sllv\n%d<<%d=%d",a,b,c);
			end
			ed_srl:
			begin
				c=a>>b;
				$display("alu:srl\n%d>>%d=%d",a,b,c);
			end
			ed_srlv:
			begin
				c=a>>b;
				$display("alu:srlv\n%d>>%d=%d",a,b,c);
			end
			ed_sra:
			begin
				c=a;
				for(i=0;i<b && i<32;i=i+1)
					c={{_zero[1:0]},{c[31:1]}};
				$display("alu:sra\n%d>>>%d=%d",a,b,c);
			end
			ed_srav:
			begin
				c=a;
				for(i=0;i<b && i<32;i=i+1)
					c={{_zero[1:0]},{c[31:1]}};
				$display("alu:srav\n%d>>>%d=%d",a,b,c);
			end

			ed_slt:
			begin
				c=(a<b);
				$display("alu:slt\n%d<%d=%d",a,b,c);
			end
			ed_sltu:
			begin
				c=(a<b);
				$display("alu:sltu\n%d<%d=%d",a,b,c);
			end
			ex_slt:
			begin
				c=(a<b);
				$display("alu:ex_slt\n%d<%d=%d",a,b,c);
			end

			ed_mfhi:
			begin
				c=hi;
				$display("alu:mfhi\nc=%d",c);
			end
			ed_mflo:
			begin
				c=lo;
				$display("alu:mflo\nc=%d",c);
			end
			ed_mthi:
			begin
				hi=a;
				$display("alu:mthi\nhi=%d",hi);
			end
			ed_mtlo:
			begin
				lo=a;
				$display("alu:mtlo\nlo=%d",lo);
			end
			ex_beq:
			begin
				c=(a==b);
				$display("alu:beq\n%d==%d=%d",a,b,c);
			end
			ex_bne:
			begin
				c=(a!=b);
				$display("alu:bne\n%d!=%d=%d",a,b,c);
			end
			ex_bgez:
			begin
				c=(a[31]!=1);
				$display("alu:bgez\n%d>=0=%d",a,c);
			end
			ex_bgtz:
			begin
				c=(a!=0&&a[31]!=1);
				$display("alu:bgtz\n%d>0=%d",a,c);
			end
			ex_blez:
			begin
				c=(a[31]==1||a==0);
				$display("alu:blez\n%d<=0=%d",a,c);
			end
			ex_bltz:
			begin
				c=(a[31]==1);
				$display("alu:bltz\n%d<0=%d",a,c);
			end
			ex_a:
			begin
				c=a;
				$display("alu:a\n%d,%d",a,b);
			end
			ex_b:
			begin
				c=b;
				$display("alu:b\n%d,%d",a,b);
			end
		endcase
	end

endmodule

