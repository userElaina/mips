module gpr(
	input wire clk,
	input wire reset,
	input wire swp12,
	input wire [31:0] wd,
	input wire [1:0] reg_w,
	input wire [4:0] a1,
	input wire [4:0] a2,
	input wire [4:0] a3,
	output wire [31:0] rd1,
	output wire [31:0] rd2
);
	reg [31:0] M[0:31];
	
	integer i; 
	assign rd1=M[swp12?a2:a1];
	assign rd2=M[swp12?a1:a2];

	integer sclk=0;
	parameter mo=5;
	wire pclk;
	assign pclk=(sclk==1);
	always @(posedge clk)
	begin
		sclk=(sclk+1)%mo;	
	end

	always @(posedge pclk)
	begin
		if(reset)
		begin
			for(i=0;i<=31;i=i+1)
				M[i]=i;
		end
		if(reg_w==2)
			M[a2]=wd;
		if(reg_w==3)
			M[a3]=wd;
		$display("gprs: %d,%d,%d %h,%h,%h",a1,a2,a3,rd1,rd2,wd);
	end

endmodule






