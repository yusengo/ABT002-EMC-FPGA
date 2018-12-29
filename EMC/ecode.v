module ecode(input clk_100M,input n_rst,input[2:0] EX_Xabc,input[2:0] EX_Yabc,input[2:0] EX_Aabc,input[2:0] EX_Babc,input EX_AM,input EX_BM,
//capen[0]:Xen	capen[1]:Yen	capen[2]:Aen	capen[3]:Ben	
input[3:0] capen,
//ecdrst[0]:Xecdrst	ecdrst[1]:Yecdrst	ecdrst[2]:Aecdrst	ecdrst[3]:Becdrst
input[3:0] ecdrst,
input[31:0] XECDRSTValue,input[31:0] YECDRSTValue,input[31:0] AECDRSTValue,input[31:0] BECDRSTValue,
output[31:0] XECDValue,output[31:0] YECDValue,output[31:0] AECDValue,output[31:0] BECDValue,
output[31:0] XCAPValue,output[31:0] YCAPValue,output[31:0] ACAPValue,output[31:0] BCAPValue,
//capok[0]:Xok	capok[1]:Yok	capok[2]:Aok	capok[3]:Bok
output[3:0] capok,
//M
input[3:0] Mcapen,
//ecdrst[0]:Xecdrst	ecdrst[1]:Yecdrst	ecdrst[2]:Aecdrst	ecdrst[3]:Becdrst
input[3:0] Mecdrst,
input[31:0] MECDRSTValue,
output[31:0] MECDValue,output[31:0] MCAPValue,
//capok[0]:Xok	capok[1]:Yok	capok[2]:Aok	capok[3]:Bok
output Mcapok
);

reg ECDclk;//50MHz
wire A1o,B1o,C1o,A2o,B2o,C2o,A3o,B3o,C3o,A4o,B4o,C4o,AMo,BMo;

always@(posedge clk_100M or negedge n_rst)
begin
	if(!n_rst)
	begin
		ECDclk 	<= 1'd0;
	end
	else
	begin
		ECDclk	<= ~ECDclk;
	end
end
						
//EX_Xabc[0]:XA	EX_Xabc[1]:XB	EX_Xabc[2]:XC
JHFilter efilterXA(.data_in(EX_Xabc[0:0]), .data_out(A1o), .clk(ECDclk));
JHFilter efilterXB(.data_in(EX_Xabc[1:1]), .data_out(B1o), .clk(ECDclk));
JHFilter efilterXC(.data_in(EX_Xabc[2:2]), .data_out(C1o), .clk(ECDclk));

JHFilter efilterYA(.data_in(EX_Yabc[0:0]), .data_out(A2o), .clk(ECDclk));
JHFilter efilterYB(.data_in(EX_Yabc[1:1]), .data_out(B2o), .clk(ECDclk));
JHFilter efilterYC(.data_in(EX_Yabc[2:2]), .data_out(C2o), .clk(ECDclk));

JHFilter efilterAA(.data_in(EX_Aabc[0:0]), .data_out(A3o), .clk(ECDclk));
JHFilter efilterAB(.data_in(EX_Aabc[1:1]), .data_out(B3o), .clk(ECDclk));
JHFilter efilterAC(.data_in(EX_Aabc[2:2]), .data_out(C3o), .clk(ECDclk));

JHFilter efilterBA(.data_in(EX_Babc[0:0]), .data_out(A4o), .clk(ECDclk));
JHFilter efilterBB(.data_in(EX_Babc[1:1]), .data_out(B4o), .clk(ECDclk));
JHFilter efilterBC(.data_in(EX_Babc[2:2]), .data_out(C4o), .clk(ECDclk));

JHFilter efilterAM(.data_in(EX_AM), .data_out(AMo), .clk(ECDclk));
JHFilter efilterBM(.data_in(EX_BM), .data_out(BMo), .clk(ECDclk));

//XYAB轴及手脉的正交解码   							//ECD V				//CAP V					//cap en				//CAP OK OR NOT	//RST					//RST V						//sync clk
JHDecode decodeX(.A(A1o), .B(B1o), .C(C1o), .edata(XECDValue), .eCapData(XCAPValue), .bCap(capen[0]), .CapSt(capok[0]), .n_rst(ecdrst[0]), .rstVal(XECDRSTValue), .clk(ECDclk));
JHDecode decodeY(.A(A2o), .B(B2o), .C(C2o), .edata(YECDValue), .eCapData(YCAPValue), .bCap(capen[1]), .CapSt(capok[1]), .n_rst(ecdrst[1]), .rstVal(YECDRSTValue), .clk(ECDclk));
JHDecode decodeA(.A(A3o), .B(B3o), .C(C3o), .edata(AECDValue), .eCapData(ACAPValue), .bCap(capen[2]), .CapSt(capok[2]), .n_rst(ecdrst[2]), .rstVal(AECDRSTValue), .clk(ECDclk));
JHDecode decodeB(.A(A4o), .B(B4o), .C(C4o), .edata(BECDValue), .eCapData(BCAPValue), .bCap(capen[3]), .CapSt(capok[3]), .n_rst(ecdrst[3]), .rstVal(BECDRSTValue), .clk(ECDclk));

JHDecode decodeM(.A(AMo), .B(BMo), .C(1'b0), .edata(MECDValue), .eCapData(MCAPValue), .bCap(1'b0),		.CapSt(Mcapok),	.n_rst(Mecdrst),	 .rstVal(MECDRSTValue), .clk(ECDclk));

endmodule


//滤波模块
module JHFilter(input data_in,output reg data_out,input clk);//输入信号(in)，输出信号(out)，同步时钟37.5M(in)->50MHz

reg[3:0] d_que;

always @(posedge clk)
begin
	d_que[3:0] <= {d_que[2:0],data_in};
	
	if((d_que[3:1] == 3'd0)||(d_que[3:1] == 3'd7))
	begin
		data_out <= d_que[3:3];
	end
end

endmodule


//正交解码模块
//A相输入(in)，B相输入(in)，C相输入(in)，编码器值(out)，编码器捕获值(out)，捕获开关(in)，是否捕获到(out)，复位(in)，复位值(in)，同步时钟(in)
module JHDecode(input A,input B,input C,output reg[31:0] edata,output reg[31:0] eCapData,input bCap,output reg CapSt,input n_rst,input [31:0] rstVal,input clk);

reg cPre;
reg[1:0] state;

always@(posedge clk)
begin
	if(!n_rst)
	begin
		edata		<=	rstVal;
		/*			
		if(A&B)
			state		<=	one_one;
		else 
			if(A&~B)
				state		<=	one_zero;
			else 
				if(~A&B)
					state<=zero_one;
				else
					state<=zero_zero;
		*/
		CapSt	<=	1'b0;
		state <= {A,B};
	end
	else
	begin
		cPre	<=	C;
		if(bCap)
		begin
			if(cPre == 1'b0 && C == 1'b1)//posivie edge capture
			begin
				CapSt		<=	1'b1;
				eCapData	<=	edata;
			end
		end
		else
		begin
			CapSt			<=	1'b0;
		end
				
		case(state)
			2'b11:
			begin
			/*
				if(A&~B)
					begin
						state<=one_zero;
						edata_reg<=edata_reg-32'd1;
					end
				else if(~A&B)
					begin
						state<=zero_one;
						edata_reg<=edata_reg+32'd1;
					end
				else if(~A&~B)
					begin
						state<=zero_zero;
					end
				else
					begin
						state<=one_one;
						edata_reg<=edata_reg;
					end
			*/
				state 	<= {A,B};
				
				if(A&~B)
					edata	<=	edata	-	32'd1;
				else
					if(~A&B)
						edata	<=	edata	+	32'd1;
			end
			
			2'b10:
			begin
			/*
				if(~A&~B)
					begin
						state<=zero_zero;
						edata_reg<=edata_reg-32'd1;
					end
				else if(A&B)
					begin
						state<=one_one;
						edata_reg<=edata_reg+32'd1;
					end
				else if(~A&B)
					begin
						state<=zero_one;
					end
				else
					begin
						state<=one_zero;
						edata_reg<=edata_reg;
					end
			*/		
				state 	<= {A,B};
				
				if(~A&~B)
					edata	<=	edata	-	32'd1;
				else
					if(A&B)
						edata	<=	edata	+	32'd1;
			end
			
			2'b01:
			begin
			/*
				if(A&B)
					begin
						state<=one_one;
						edata_reg<=edata_reg-32'd1;
					end
				else if(~A&~B)
					begin
						state<=zero_zero;
						edata_reg<=edata_reg+32'd1;
					end
				else if(A&~B)
					begin
						state<=one_zero;
					end
				else
					begin
						state<=zero_one;
						edata_reg<=edata_reg;
					end
			*/
				state 	<= {A,B};
				
				if(~A&~B)
					edata	<=	edata	+	32'd1;
				else
					if(A&B)
						edata	<=	edata	-	32'd1;			
			end
			
			2'b00:
			begin
			/*
				if(~A&B)
					begin
						state<=zero_one;
						edata_reg<=edata_reg-32'd1;
					end
				else if(A&~B)
					begin
						state<=one_zero;
						edata_reg<=edata_reg+32'd1;
					end
				else if(A&B)
					begin
						state<=one_one;
					end
				else
					begin
						state<=zero_zero;
						edata_reg<=edata_reg;
					end
			*/
				state 	<= {A,B};
				
				if(A&~B)
					edata	<=	edata	+	32'd1;
				else
					if(~A&B)
						edata	<=	edata	-	32'd1;
					
			end
				
			default:
			begin
				state 	<= {A,B};
			end
			
		endcase
	end
end

endmodule
