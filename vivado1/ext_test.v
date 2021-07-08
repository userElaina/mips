module test_ext;
	reg [15:0] A;
	reg Extop;
	wire [31:0] B;

	ext qwq(A,Extop,B);

	initial
	begin
		A={16{1'b1}};
		Extop=0;
		#10 Extop=1;
		#10 A={8{2'b10}};
		#10 Extop=0;
		#10 $finish;
	end
endmodule