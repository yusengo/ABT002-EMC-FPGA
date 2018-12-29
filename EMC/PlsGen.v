module PlsGen(input clk_4M,input n_rst,
input[15:0] XPluse,input[15:0] YPluse,input[15:0] APluse,input[15:0] BPluse,input readyFlag,//Axis para in
output XPlsIO,output XDirIO,output YPlsIO,output YDirIO,output APlsIO,output ADirIO,output BPlsIO,output BDirIO//axis out
);

reg[7:0] XPlsValue,YPlsValue,APlsValue,BPlsValue;
reg[7:0] XPlsInfo,YPlsInfo,APlsInfo,BPlsInfo;

always@(posedge readyFlag or negedge n_rst)
begin
	if(!n_rst)
	begin
		XPlsInfo  <= 8'd0;
		XPlsValue <= 8'd0;
		
		YPlsInfo  <= 8'd0;
		YPlsValue <= 8'd0;
		
		APlsInfo  <= 8'd0;
		APlsValue <= 8'd0;
		
		BPlsInfo  <= 8'd0;
		BPlsValue <= 8'd0;		
	end
	else
	begin
		XPlsInfo  <= XPluse[15:8];
		XPlsValue <= XPluse[7:0];
		
		YPlsInfo  <= YPluse[15:8];
		YPlsValue <= YPluse[7:0];
		
		APlsInfo  <= APluse[15:8];
		APlsValue <= APluse[7:0];
		
		BPlsInfo  <= BPluse[15:8];
		BPlsValue <= BPluse[7:0];
	end
end


JHAcc jhaccX(	.clk_4M(clk_4M),
					.n_rst(n_rst),
					.axisPlsInfo(XPlsInfo),
					.axisPlsValue(XPlsValue),
					.WaxisDir(XDirIO),
					.WaxisPls(XPlsIO)
				);
				
JHAcc jhaccY(	.clk_4M(clk_4M),
					.n_rst(n_rst),
					.axisPlsInfo(YPlsInfo),
					.axisPlsValue(YPlsValue),
					.WaxisDir(YDirIO),
					.WaxisPls(YPlsIO)
				);
				
JHAcc jhaccA(	.clk_4M(clk_4M),
					.n_rst(n_rst),
					.axisPlsInfo(APlsInfo),
					.axisPlsValue(APlsValue),
					.WaxisDir(ADirIO),
					.WaxisPls(APlsIO)
				);
				
JHAcc jhaccB(	.clk_4M(clk_4M),
					.n_rst(n_rst),
					.axisPlsInfo(BPlsInfo),
					.axisPlsValue(BPlsValue),
					.WaxisDir(BDirIO),
					.WaxisPls(BPlsIO)
				);
				
/*
JHAcc jhaccX(clk_10M,n_rst,XPlsInfo,XPlsValue,XDirIO,XPlsIO);
JHAcc jhaccY(clk_10M,n_rst,YPlsInfo,YPlsValue,YDirIO,YPlsIO);
JHAcc jhaccA(clk_10M,n_rst,APlsInfo,APlsValue,ADirIO,APlsIO);
JHAcc jhaccB(clk_10M,n_rst,BPlsInfo,BPlsValue,BDirIO,BPlsIO);*/

endmodule

module JHAcc(input clk_4M,input n_rst,input[7:0] axisPlsInfo,input[7:0] axisPlsValue,output WaxisDir,output WaxisPls);

reg freshFlag;
reg[1:0] StateMP;
reg[11:0] axisPlsCnt,axisTimeCnt;

reg axisDirIO,axisPlsIO;
reg pluseType;

always@(posedge clk_4M or negedge n_rst)
begin
	if(!n_rst)
	begin	
		axisPlsIO 	<= 1'd0;
		axisDirIO 	<= 1'd0;
		pluseType 	<= 1'd0;
		freshFlag 	<= 1'd0;
		StateMP 		<= 2'd0;
	end
	else
	begin
		case(StateMP)
		
			2'd0:
			begin
				if(freshFlag == axisPlsInfo[2:2])
				begin
					axisPlsIO <= 1'd0;
					axisPlsCnt <= 12'd0;
					axisTimeCnt <= 12'd0;
				end
				else
				begin
					freshFlag <= ~freshFlag;
					if(axisPlsValue == 8'd0)
					begin
						axisPlsIO <= 1'd0;
						StateMP <= 2'd0;
					end
					else
					begin
						axisDirIO <= axisPlsInfo[0:0];
						pluseType <= axisPlsInfo[1:1];
						StateMP <= 2'd1;
					end					
				end
			end
			
			2'd1:
			begin
				if(axisPlsCnt + axisPlsValue > 12'd1600)
					axisPlsCnt <= axisPlsCnt + axisPlsValue - 12'd1600;
				else
					axisPlsCnt <= axisPlsCnt + axisPlsValue;
				
				if(axisPlsCnt < 12'd800)
					axisPlsIO <= 1'd1;
				else
					axisPlsIO <= 1'd0;
		
				if(axisTimeCnt < 12'd1598)
				begin
					axisTimeCnt <= axisTimeCnt + 12'd1;
					StateMP <= 2'd1;
				end
				else
				begin
					axisTimeCnt <= 12'd0;
					StateMP <= 2'd0;
				end
			end
			
			default:
			begin
				StateMP <= 2'd0;
			end
			
		endcase
	end
end

assign WaxisPls = (pluseType)?(axisDirIO?axisPlsIO:1'b0):axisPlsIO;
assign WaxisDir = (pluseType)?(axisDirIO?1'b0:axisPlsIO):axisDirIO;

endmodule
