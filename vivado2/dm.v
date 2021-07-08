module dm(
	input wire clk,
	input wire reset,
	input wire dm_w,
	input wire [2:0] dm_type,
	input wire [31:0] wd,
	input wire [31:0] a1,
	output reg [31:0] rd1
);
	
	parameter dmt_w=3'b000;
	parameter dmt_h=3'b100;
	parameter dmt_hu=3'b101;
	parameter dmt_b=3'b110;
	parameter dmt_bu=3'b111;

	reg [31:0] M[0:31];
	wire [4:0] a;
	assign a=dm_type[2]?a1[6:2]:a1[4:0];
	wire [31:0] rdw;
	assign rdw=M[a];
	wire [15:0] rdh;
	assign rdh=a1[1]?rdw[31:16]:rdw[15:0];
	wire [7:0] rdb;
	assign rdb=a1[1]?(a1[0]?rdw[31:24]:rdw[23:16]):(a1[0]?rdw[15:8]:rdw[7:0]);
	wire [31:0] rdhp;
	assign rdhp={{16{dm_type[0]&rdh[15]}},rdh};
	wire [31:0] rdbp;
	assign rdbp={{24{dm_type[0]&rdb[7]}},rdb};
	wire [31:0] ans;
	assign ans=dm_type[2]?(
		dm_type[1]?rdbp:rdhp
	):rdw;

	// assign rd1=ans;
	
	parameter _o={32{1'b0}};
	integer i; 

	integer sclk=0;
	parameter mo=6;
	wire pclk4;
	assign pclk4=(sclk==4);
	always @(posedge clk)
	begin
		sclk=(sclk+1)%mo;	
	end

	always @(posedge pclk4)
	begin
		if(dm_w)
			if(dm_type==dmt_w)
			begin
				M[a]=wd;
			end
			if(dm_type==dmt_h)
			begin
				for(i=0;i<=15;i=i+1)
					M[a][i+16*a1[1]]=wd[i];
			end
			if(dm_type==dmt_b)
			begin
				for(i=0;i<=7;i=i+1)
					M[a][i+8*a1[1:0]]=wd[i];
			end
		rd1=ans;
		if(reset)
		begin
			for(i=0;i<32;i=i+1)
				M[i]=_o;
		end
		$display("dm:[%d]=%h,ans=%h",a,rdw,rd1);
	end

endmodule