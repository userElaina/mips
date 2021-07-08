module alu(a,b,c,con);
	input[31:0]a;
	input[31:0]b;
	input[1:0]con;
	output[31:0]c;

	parameter _add=2'b11;
	parameter _sub=2'b10;
	parameter _and=2'b00;
	// parameter _or=2'b01;

	reg[31:0]d;
	assign c=a+b;
	
	// if(con==_add)
	// 	d<=(a+b);
	// else if(con==_sub)
	// 	d<=(a-b);
	// else if(con==_and)
	// 	d<=(a&b);
endmodule

