module co(
	input wire [5:0] o,
	input wire [5:0] f,
	output wire Regdst,
	output wire Alusrc,
	output wire Memtoreg,
	output wire Regwrite,
	output wire Memwrite,
	output wire npc_sel,
	output wire Extop,
	output wire [1:0] Aluop
);
	wire addu=(~o[5])&(~o[4])&(~o[3])&(~o[2])&(~o[1])&(~o[0])&f[5]&(~f[4])&(~f[3])&(~f[2])&(~f[1])&f[0];
	wire subu=(~o[5])&(~o[4])&(~o[3])&(~o[2])&(~o[1])&(~o[0])&f[5]&(~f[4])&(~f[3])&(~f[2])&f[1]&f[0];
	wire ori=(~o[5])&(~o[4])&o[3]&o[2]&(~o[1])&o[0];
	wire lw=o[5]&(~o[4])&(~o[3])&(~o[2])&o[1]&o[0];
	wire sw=o[5]&(~o[4])&o[3]&(~o[2])&o[1]&o[0];
	wire beq=(~o[5])&(~o[4])&(~o[3])&o[2]&(~o[1])&(~o[0]);
	wire lui=(~o[5])&(~o[4])&o[3]&o[2]&o[1]&o[0];

	assign Regdst=addu|subu|sw;
	assign Alusrc=ori|lw|sw;
	assign Memtoreg=lw|lui;
	assign Regwrite=addu|subu|ori|lw|lui;
	assign Memwrite=sw;
	assign npc_sel=beq;
	assign Extop=sw|lui;
	assign Aluop={addu|subu|lw|sw|beq,addu|ori|lw|sw};

	reg _aa;

	always@(*)
	begin
		_aa=0;
		if(addu)
		begin
			$display("co: addu op%b func%b",o,f);
			_aa=1;
		end
		if(subu)
		begin
			$display("co: subu op%b func%b",o,f);
			_aa=1;
		end
		if(ori)
		begin
			$display("co: ori op%b func%b",o,f);
			_aa=1;
		end
		if(lw)
		begin
			$display("co: lw op%b func%b",o,f);
			_aa=1;
		end
		if(sw)
		begin
			$display("co: sw op%b func%b",o,f);
			_aa=1;
		end
		if(beq)
		begin
			$display("co: beq op%b func%b",o,f);
			_aa=1;
		end
		if(lui)
		begin
			$display("co: lui op%b func%b",o,f);
			_aa=1;
		end
		if(~_aa)$display("co: None op%b func%b",o,f);
	end

endmodule