`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HUINS
// Engineer: 
// 
// Create Date: 2012/11/28 13:46:07
// Design Name: segment
// Module Name: clock
// Project Name: segment
// Target Devices: xc7z020clg484-1
// Tool Versions: Xilinx PlanAhead 14.3
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock(
  input clk_in,
  input resetn,
  output reg [31:0] segdata);

  reg temp_clk;
  reg onesec_clk;
  reg tensec_clk;
  reg onemin_clk;
  reg tenmin_clk;
  reg hour_clk;
  reg [3:0] onesec_cnt;
  reg [3:0] tensec_cnt;
  reg [3:0] onemin_cnt;
  reg [3:0] tenmin_cnt;
  reg [3:0] hour_cnt;
  reg [32:0] cnt;

  always @ (negedge resetn or posedge clk_in)
  begin
    if (!resetn)
    begin
      segdata[11:8] <= 4'b0000;
      segdata[23:20] <= 4'b0000;
    end
    else
    begin
      segdata[11:8] <= 4'b1010;
      segdata[23:20] <= 4'b1010;
    end
  end 


  always @ (negedge resetn or posedge clk_in)
  begin
    if (!resetn)
    begin
      cnt <= 33'd0;
      onesec_clk <= 1'b0;
    end
    else
    begin
      if (cnt < 33'd12499999) 
	cnt <= cnt + 33'd1;
      else cnt <= 33'd0;
      if (cnt == 33'd12499999)
	 onesec_clk <= ~onesec_clk;
    end
  end

  always @ (negedge resetn or posedge  onesec_clk)
  begin
    if (!resetn)
    begin
      onesec_cnt <= 4'b0001;
      tensec_clk <= 1'b0;
      segdata[3:0] <= 4'b0000;
    end
    else
    begin
      if (onesec_cnt < 4'b1001)
        onesec_cnt <= onesec_cnt + 4'b0001;
      else
        onesec_cnt <= 4'b0000;
      if (onesec_cnt == 4'b0000)
        tensec_clk <= 1'b1;
      else
        tensec_clk <= 1'b0;
      segdata[3:0] <= onesec_cnt;
    end
  end


  always @  (negedge resetn or posedge tensec_clk)
  begin
    if (!resetn)
    begin
      tensec_cnt <= 4'b0001;
      onemin_clk <= 1'b0;
      segdata[7:4] <= 4'b0000;
    end
    else
    begin
      if (tensec_cnt < 4'b0101)
        tensec_cnt <= tensec_cnt + 4'b0001;
      else
         tensec_cnt <= 4'b0000;
      if (tensec_cnt == 4'b0000)
        onemin_clk <= 1'b1;
      else
        onemin_clk <= 1'b0;
      segdata[7:4] <= tensec_cnt;
    end
  end

  always @ (negedge resetn or posedge onemin_clk)
  begin
    if (!resetn)
    begin
      onemin_cnt <= 4'b0001;
      tenmin_clk <= 1'b0;
      segdata[15:12] <= 4'b0000;
    end
    else
    begin
      if (onemin_cnt < 4'b1001)
        onemin_cnt <= onemin_cnt + 4'b0001;
      else
        onemin_cnt <= 4'b0000;
      if (onemin_cnt == 4'b0000)
        tenmin_clk <= 1'b1;
      else
        tenmin_clk <= 1'b0;
      segdata[15:12] <= onemin_cnt;
    end
  end

  always @ (negedge resetn or posedge tenmin_clk)
  begin
    if (!resetn)
    begin
      tenmin_cnt <= 4'b0001;
      hour_clk <= 1'b0;
      segdata[19:16] <= 4'b0000;
    end
    else
    begin
      if (tenmin_cnt < 4'b0101)
        tenmin_cnt <= tenmin_cnt + 4'b0001;
      else
        tenmin_cnt <= 4'b0000;
      if (tenmin_cnt == 4'b0000)
        hour_clk <= 1'b1;
      else
        hour_clk <= 1'b0;
      segdata[19:16] <= tenmin_cnt;
    end
  end

  always @ (negedge resetn or posedge hour_clk)
  begin
    if (!resetn)
    begin
      hour_cnt <= 4'b0001;
      segdata[31:24] <= 8'h12;
    end
    else
    begin
      if (hour_cnt < 4'b1011)
        hour_cnt <= hour_cnt + 4'b0001;
      else
        hour_cnt <= 4'b0000;
      if (hour_cnt == 4'b0000)
        segdata[31:24] <= 8'h12;
      else if (hour_cnt == 4'b1010)
        segdata[31:24] <= 8'h10;
      else if (hour_cnt == 4'b1011)
        segdata[31:24] <= 8'h11;
      else
        segdata[31:24] <= {4'hb0000, hour_cnt};
    end
  end

endmodule
