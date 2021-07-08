module test_alu;
	reg [31:0] a;
	reg [31:0] b;
	reg [1:0] con;
	wire [31:0] c;

	alu qwq(a,b,c,con);

	parameter _add=2'b11;
	parameter _sub=2'b10;
	parameter _and=2'b00;
	parameter _or=2'b01;

	initial
	begin
		a=9;
		b=5;

		#10 con=_add;
		#10	con=_sub;
		#10	con=_and;
		#10	con=_or;
		#10 $finish;

	end
endmodule