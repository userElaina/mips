module test_dm;
	reg [31:0] D;
	reg Memtoreg;
	reg Memwrite;
	reg Clk;
	reg Reset;
	reg [4:0] A;
	wire [31:0] out_DM;

	dm qwq(D,Memtoreg,Memwrite,Clk,Reset,A,out_DM);

	initial
	begin
		Clk=0;
		Memtoreg=0;
		Memwrite=0;
		Reset=1;
		#20 Reset=0;
		#20 
		D={16{2'b10}};
		A=3;
		Memtoreg=1;
		#20
		Memtoreg=0;
		Memwrite=1;
		#20
		Memtoreg=1;
		A=2;
		D={32{2'b1}};
		#40
		Memtoreg=1;
		Memwrite=0;
		A=3;
		#20 $finish;
	end

    always  
        #10 Clk=~Clk;
endmodule






