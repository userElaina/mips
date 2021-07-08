module cp0(
	input wire clk,
	input wire reset,
	input wire cp0_w,
	input wire cp0_epc,
	input wire [31:0] wd,
	input wire [4:0] a1,
	output wire [31:0] rd1
);
	reg [31:0] M[0:31];
	reg [4:0] epc=0;
	
	integer i;
	wire [4:0] mi;
	assign mi=cp0_epc?epc:a1;
	assign rd1=M[mi];

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
		if(cp0_w)
			M[a1]=wd;
		if(reset)
		begin
			for(i=0;i<=31;i=i+1)
				M[i]=i;
		end
		$display("cp0:%d,%d",a1,rd1);
	end

endmodule






