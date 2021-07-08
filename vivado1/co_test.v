module test_co;
	reg [5:0] o;
	reg [5:0] f;
	wire Regdst;
	wire Alusrc;
	wire Memtoreg;
	wire Regwrite;
	wire Memwrite;
	wire npc_sel;
	wire Extop;
	wire [1:0] Aluop;

	co qwq(o,f,Regdst,Alusrc,Memtoreg,Regwrite,Memwrite,npc_sel,Extop,Aluop);

	initial
	begin
		o=6'b000000;
		f=6'b100001;
		#20
		f=6'b100011;
		#20
		o=6'b001101;
		#20
		o=6'b100011;
		#20
		o=6'b101011;
		#20
		o=6'b000100;
		#20
		o=6'b001111;
		#20 $finish;
	end

endmodule