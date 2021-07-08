module gprs(
	input wire Regwrite,
	input wire Clk,
	input wire Reset,
	input wire [31:0] Wd,
	input wire [4:0] A1,
	input wire [4:0] A2,
	input wire [4:0] A3,
	output wire [31:0] Rd1,
	output wire [31:0] Rd2
);
	reg [31:0] M[0:31];
	
	parameter _o={32{1'b0}};
	integer i; 
	assign Rd1=M[A1];
	assign Rd2=M[A2];

	always @(posedge Clk)
	begin
		if(Reset)
		begin
			for(i=0;i<=31;i=i+1)
				M[i]=_o;
			M[0]=32'd1;
			M[1]=32'd2;
			M[2]=32'd3;
			M[3]=32'd4;
			M[4]=32'd5;
			M[5]=32'd6;
			M[6]=32'd7;
			M[7]=32'd8;
		end
		if(Regwrite)
			M[A3]=Wd;
		$display("gprs: %d,%d,%d %h,%h,%h",A1,A2,A3,Rd1,Rd2,Wd);
	end

endmodule






