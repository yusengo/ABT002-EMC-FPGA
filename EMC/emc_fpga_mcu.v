module emc_fpga_mcu(input clk_100M,input n_rst,input spi_ncs,input spi_clk,input spi_mosi,output reg spi_miso,//SPI
output reg[15:0] F_IO_Output,output reg[15:0] F_IO_RSEN,//IO
output [15:0] XPluse,output [15:0] YPluse,output [15:0] APluse,output [15:0] BPluse,output reg readyFlag,//Axis
//
//capen[0]:Xen	capen[1]:Yen	capen[2]:Aen	capen[3]:Ben	
output[3:0] capen,
//ecdrst[0]:Xecdrst	ecdrst[1]:Yecdrst	ecdrst[2]:Aecdrst	ecdrst[3]:Becdrst
output[3:0] ecdrst,
output[31:0] XECDRSTValue,output[31:0] YECDRSTValue,output[31:0] AECDRSTValue,output[31:0] BECDRSTValue,
input[31:0] XECDValue,input[31:0] YECDValue,input[31:0] AECDValue,input[31:0] BECDValue,
input[31:0] XCAPValue,input[31:0] YCAPValue,input[31:0] ACAPValue,input[31:0] BCAPValue,
//capok[0]:Xok	capok[1]:Yok	capok[2]:Aok	capok[3]:Bok
input[3:0] capok,
//M
output[3:0] Mcapen,
//ecdrst[0]:Xecdrst	ecdrst[1]:Yecdrst	ecdrst[2]:Aecdrst	ecdrst[3]:Becdrst
output[3:0] Mecdrst,
output[31:0] MECDRSTValue,
input[31:0] MECDValue,input[31:0] MCAPValue,
//capok[0]:Xok	capok[1]:Yok	capok[2]:Aok	capok[3]:Bok
input Mcapok,
//

input [3:0] F_Alarm,input [3:0] F_Home,input [7:0] F_LimitPN,input [15:0] F_IO_Input,

output reg[7:0] FPGAframeData,output reg[3:0] syncStateM,output reg[7:0] spiCnt,output reg errFlag);//TEST


reg [15:0] rdRam [31:0];
reg [15:0] wrRam [31:0];

//reg[7:0]  spiCnt;
//reg[3:0]  syncStateM;
//reg frameUpdated;
reg[7:0]  clkCnt;
reg[7:0]  clkCnt1;
reg[7:0]  clkCnt2;
reg[7:0]  clkCnt3;
//reg[15:0] FPGAframeData;
reg[7:0] MCUframeDataSPI;
reg[7:0] MCUframeData;
reg[7:0] MCUframeData1;
reg[7:0] MCUframeData2;
reg[7:0] MCUframeData3;

reg[7:0] framePre;
reg[7:0] frameMode;
reg[7:0] frameDatast;
reg[7:0] frameDatand;
reg[3:0] axisArrived;

reg[1:0] frameGotted;
reg[3:0] sysDelay;

//reg errFlag;
reg errValue1;
reg errValue2;
reg ramReadCache;


assign XECDRSTValue[31:0]	  = {wrRam[1][15:0],wrRam[0][15:0]};
assign YECDRSTValue[31:0]	  = {wrRam[3][15:0],wrRam[2][15:0]};
assign AECDRSTValue[31:0]	  = {wrRam[5][15:0],wrRam[4][15:0]};
assign BECDRSTValue[31:0]	  = {wrRam[7][15:0],wrRam[6][15:0]};
//RSVD
assign MECDRSTValue[31:0]	  = {wrRam[13][15:0],wrRam[12][15:0]};

assign capen[3:0]	  			  = wrRam[15][3:0];
assign ecdrst[3:0]  			  = wrRam[14][3:0];
assign Mcapen	  				  = wrRam[15][6:6];
assign Mecdrst	  				  = wrRam[14][6:6];

assign XPluse[15:0] 			  = wrRam[16][15:0];
assign YPluse[15:0] 			  = wrRam[17][15:0];
assign APluse[15:0] 		     = wrRam[18][15:0];
assign BPluse[15:0] 			  = wrRam[19][15:0];

always@(posedge clk_100M or negedge n_rst)
begin
	if(!n_rst)
	begin
		MCUframeData1 <= 8'd0;
		MCUframeData2 <= 8'd0;

	end
	else
	begin
		if((MCUframeData1 == MCUframeData2))
		begin
			MCUframeData <= MCUframeData2;
		end
		
		MCUframeData1 <= MCUframeData2;
		MCUframeData2 <= MCUframeDataSPI;
	end	
end

always@(posedge clk_100M or negedge n_rst)
begin
	if(!n_rst)
	begin
		rdRam[0] <= 16'd0;
		rdRam[1] <= 16'd0;
		rdRam[2] <= 16'd0;
		rdRam[3] <= 16'd0;
		rdRam[4] <= 16'd0;
		rdRam[5] <= 16'd0;
		rdRam[6] <= 16'd0;
		rdRam[7] <= 16'd0;
		
		rdRam[12] <= 16'd0;
		rdRam[13] <= 16'd0;
		rdRam[14] <= 16'd0;
		rdRam[15] <= 16'd0;
		rdRam[16] <= 16'd0;
		rdRam[17] <= 16'd0;
		rdRam[18] <= 16'd0;
		rdRam[19] <= 16'd0;
		rdRam[20] <= 16'd0;
		rdRam[21] <= 16'd0;
		
		rdRam[26] <= 16'd0;
		rdRam[27] <= 16'd0;
		rdRam[28] <= 16'd0;
		rdRam[29] <= 16'd0;
		rdRam[30] <= 16'd0;
		rdRam[31] <= 16'd0;
		
		F_IO_Output <= 16'd0;
		F_IO_RSEN <= 16'd0;
	end
	else
	begin
		rdRam[0] <= XECDValue[15:0];
		rdRam[1] <= XECDValue[31:16];
		rdRam[2] <= YECDValue[15:0];
		rdRam[3] <= YECDValue[31:16];
		rdRam[4] <= AECDValue[15:0];
		rdRam[5] <= AECDValue[31:16];
		rdRam[6] <= BECDValue[15:0];
		rdRam[7] <= BECDValue[31:16];
		//RSVD
		rdRam[12] <= MECDValue[15:0];
		rdRam[13] <= MECDValue[31:16];
		
		rdRam[14] <= XCAPValue[15:0];
		rdRam[15] <= XCAPValue[31:16];
		rdRam[16] <= YCAPValue[15:0];
		rdRam[17] <= YCAPValue[31:16];
		rdRam[18] <= ACAPValue[15:0];
		rdRam[19] <= ACAPValue[31:16];
		rdRam[20] <= BCAPValue[15:0];
		rdRam[21] <= BCAPValue[31:16];
		//RSVD
		rdRam[26] <= MCAPValue[15:0];
		rdRam[27] <= MCAPValue[31:16];
		
		rdRam[28] <= {Mcapok,2'B00,capok[3:0]};
		//F_Alarm[3:0] 3 2 1 0,F_Home[3:0] 3 2 1 0,F_LimitPN[7:0] Limit3+ 3- 2+ 2- 1+ 1- 0+ 0-
		rdRam[29] <= {F_LimitPN[7:6],F_Home[3],F_Alarm[3],		F_LimitPN[5:4],F_Home[2],F_Alarm[2],	F_LimitPN[3:2],F_Home[1],F_Alarm[1],	F_LimitPN[1:0],F_Home[0],F_Alarm[0]};
		rdRam[30] <= F_IO_Input[15:0];	
		rdRam[31] <= 16'd31;		
		
		F_IO_Output <= wrRam[22];
		F_IO_RSEN <= wrRam[23];
	end
end

always@(negedge spi_clk or posedge spi_ncs)
begin
	if(spi_ncs == 1'd1)
	begin
		clkCnt 			<= 8'd0;
		MCUframeDataSPI[7:0] <= 8'd0;
	end
	else
	begin
		clkCnt				<= clkCnt + 8'd1;
		MCUframeDataSPI[7:0] <= {MCUframeDataSPI[6:0],spi_mosi};
	end
end

always@(posedge spi_clk or posedge spi_ncs)
begin
	if(spi_ncs)
	begin
		spi_miso 		<= 1'd0;
	end
	else
	begin
		spi_miso 		<= (FPGAframeData[7:0] >> (((spiCnt & 8'hF8)|8'h07) - spiCnt));
	end
end


always@(posedge clk_100M or negedge n_rst)
begin
	if(!n_rst)
	begin
		clkCnt1 <= 8'd0;
		clkCnt2 <= 8'd0;
	end
	else
	begin
		if((clkCnt1 == clkCnt2))
		begin
			spiCnt <= clkCnt2;
		end
		
		clkCnt1 <= clkCnt2;
		clkCnt2 <= clkCnt;
	end	
end

always@(posedge clk_100M or negedge n_rst)
begin
	if(!n_rst)
	begin
		FPGAframeData 	<= 8'h55;
		syncStateM		<= 4'd0;
		readyFlag		<= 1'd0;
		axisArrived    <= 4'h0;
		frameGotted		<= 2'd0;
		errFlag			<= 1'd0;
		errValue1		<= 1'd0;
		errValue2		<= 1'd0;
	end
	else
	begin
		case (syncStateM)
		4'd0:
		begin
			if(errValue1 == errValue2)
			begin
				errFlag <= ~errFlag;
			end
			
			if(spi_ncs == 1'd0)
			begin
				readyFlag 		<= 1'd0;
				syncStateM		<= 4'd1;
				frameMode		<= 8'd0;
				FPGAframeData 	<= 8'h55;
				frameGotted		<= 2'd0;
				sysDelay			<= 4'd0;
				ramReadCache	<= 1'd0;
			end		
			else
			begin
				syncStateM		<= 4'd0;
				
				if(axisArrived == 4'hF)
				begin
					axisArrived <= 4'h0;
					readyFlag 	<= 1'd1;
				end
				else
				begin
		
				end
			end
		end
		
		4'd1:
		begin
			if(spi_ncs == 1'd1)
			begin
				if(sysDelay < 4'd3)
				begin
					sysDelay <= sysDelay + 4'd1;
					syncStateM <= 4'd1;
				end
				else
				begin
					sysDelay <= 4'd0;
					syncStateM<= 4'd2;
				end
				
				if(frameMode[7:7] == 1'd1)
				begin
					wrRam[frameMode[6:0]][15:0]	<= {frameDatast[7:0], frameDatand[7:0]};	
				end
				else
				begin
				
				end
			end
			else
			begin
				case(spiCnt)
					8'd8:
					begin
						if(frameGotted == 2'd0)
						begin
							frameGotted		<= 2'd1;
							framePre[7:0] 	<= MCUframeData[7:0];
							FPGAframeData[7:0] <= 8'h00;
						end
					end
				
					8'd16:
					begin
						if(frameGotted == 2'd1)
						begin
							
							if(ramReadCache == 1'd1)
							begin
								ramReadCache	<= 1'd0;
								frameGotted		<= 2'd2;
							end
							
							ramReadCache	<= 1'd1;
							frameMode[7:0] <= MCUframeData[7:0];
					
							if(MCUframeData[7:7] == 1'd0)
								begin
									FPGAframeData[7:0] <= rdRam[MCUframeData[7:0]][15:8];
								end
							else
								begin
									FPGAframeData[7:0] <= 8'd0;
								end
						end
					end
				
					8'd24:
					begin
						if(frameGotted == 2'd2)
						begin						
							
							if(ramReadCache == 1'd1)
							begin
								ramReadCache	<= 1'd0;
								frameGotted		<= 2'd3;
							end
							
							ramReadCache	<= 1'd1;
							frameDatast[7:0] <= MCUframeData[7:0];
							
							if(frameMode[7:7] == 1'd0)
								begin
									FPGAframeData[7:0] <= rdRam[frameMode[7:0]][7:0];
								end
							else
								begin
									FPGAframeData[7:0] <= 8'd0;
								end

						end
					end
				
					8'd32:
					begin
						if(frameGotted == 2'd3)
						begin
							
							if(ramReadCache == 1'd1)
							begin
								ramReadCache	<= 1'd0;
								frameGotted		<= 2'd0;
							end
							
							ramReadCache	<= 1'd1;
							
							frameDatand[7:0] 		<= MCUframeData[7:0];
							FPGAframeData[7:0] 	<= 8'haa;	
							
							if(frameMode[7:0] == 8'd150)
								errValue1	<= wrRam[22][0:0];		
						end
					end
				
					default:
					begin
					end
	
				endcase
			end
		end
		
		4'd2:
		begin
			FPGAframeData[7:0] 	<= 8'h55;		
			readyFlag 				<= 1'd0;
			
			if(sysDelay < 4'd1)
			begin
				sysDelay <= 4'd1;
				syncStateM <= 4'd2;
			end
			else
			begin
				sysDelay <= 4'd0;
				syncStateM<= 4'd0;
			end
			
			if(frameMode[7:0] == 8'd150)
				errValue2	<= wrRam[22][0:0];
			
			case(frameMode[7:0])
				8'd144:
				begin
					axisArrived[3:0] <= 4'h8;
				end
				
				8'd145:
				begin
					axisArrived[2:2] <= 1'd1;
				end
				
				8'd146:
				begin
					axisArrived[1:1] <= 1'd1;
				end
				
				8'd147:
				begin
					axisArrived[0:0] <= 1'd1;
				end
				
				default:
				begin
				end
			endcase
		end
		
		default:
		begin
			syncStateM		<= 4'd0;
		end
		
		endcase
	end
end

endmodule
