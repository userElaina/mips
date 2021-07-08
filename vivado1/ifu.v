module ifu(
	input wire IfBeq,
	input wire Zero,
	input wire Clk,
	input wire Reset,
	output wire [31:0] Instr
);
	reg [31:0] M[0:31];
	reg [29:0] a;

	assign Instr=M[a[4:0]];

	wire sign_ex;
	wire [29:0] b;
	wire [29:0] sigma;
	// assign b=0;
	assign sigma=a+b+1;
	assign b=(IfBeq&Zero)?{{17{Instr[15]}},Instr[14:2]}:0;

	always @(posedge Clk)
	begin
		if(Reset)
		begin
			a=0;
			M[0]=32'h00228021;
			M[1]=32'h00228823;
			M[2]=32'h34320080;
			M[3]=32'h8c330002;
			M[4]=32'hac310002;
			M[5]=32'h3c14abcd;
			M[6]=32'h10210004;
			M[7]=32'hffffffff;
			M[8]=32'h1042ffe0;
		end
		else
		begin
			$display("ifu: a%d b%d 0x%h",a,b,Instr);
			a=sigma;
		end
	end
	
endmodule