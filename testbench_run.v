module test_alu;
	reg[31:0]a;
	reg[31:0]b;
	reg[1:0]con;
	wire[31:0]c;

	alu qwq(a,b,c,con);

	initial
	begin
		$display("\t\t(Time Reset Newspaper Coin Res)\n");	
		$monitor("%d %d %d %d %d",$time,reset,newspaper,coin,res);	
	end

	parameter _add=2'b11;
	parameter _sub=2'b10;
	parameter _and=2'b00;

	initial
	begin
		a=9;
		b=5;
		con=_add;
		#40	con=_sub;
		#40	con=_and;

	end


	always  
		#20 clock=~clock;	
endmodule