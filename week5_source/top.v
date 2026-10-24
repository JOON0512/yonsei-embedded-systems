module top (
  // Processor System
  inout [14:0]DDR_addr,
  inout [2:0]DDR_ba,
  inout DDR_cas_n,
  inout DDR_ck_n,
  inout DDR_ck_p,
  inout DDR_cke,
  inout DDR_cs_n,
  inout [3:0]DDR_dm,
  inout [31:0]DDR_dq,
  inout [3:0]DDR_dqs_n,
  inout [3:0]DDR_dqs_p,
  inout DDR_odt,
  inout DDR_ras_n,
  inout DDR_reset_n,
  inout DDR_we_n,
  inout FIXED_IO_ddr_vrn,
  inout FIXED_IO_ddr_vrp,
  inout [53:0]FIXED_IO_mio,
  inout FIXED_IO_ps_clk,
  inout FIXED_IO_ps_porb,
  inout FIXED_IO_ps_srstb,
  input TFTLCD_CLK,
  input TFTLCD_nRESET,
  output TFTLCD_TCLK,	// TFT-LCD Clock
  output wire TFTLCD_Hsync,	// TFT-LCD HSYNC
  output wire TFTLCD_Vsync,	// TFT-LCD VSYNC
  output wire TFTLCD_DE_out,	// TFT-LCD Data enable
  output [7:3] TFTLCD_R, // TFT-LCD Red signal 
  output [7:2] TFTLCD_G, // TFT-LCD Green signal
  output [7:3] TFTLCD_B, // TFT-LCD Blue signal
  output TFTLCD_Tpower,  // TFT-LCD Backlight On signal

  // YOUR CODE GOES IN HERE
  input [1:0] TFTLCD_SW,
  // YOUR CODE GOES IN HERE

  output [1:0] LED
);

  wire BRAMCLK;
  wire [16:0] BRAMADDRA;
  wire [15:0] BRAMDATA;

  wire [31:0]M_AHB_1_haddr;
  wire [2:0]M_AHB_1_hburst;
  wire [3:0]M_AHB_1_hprot;
  wire [31:0]M_AHB_1_hrdata;
  wire M_AHB_1_hready;
  wire M_AHB_1_hresp;
  wire [2:0]M_AHB_1_hsize;
  wire [1:0]M_AHB_1_htrans;
  wire [31:0]M_AHB_1_hwdata;
  wire M_AHB_1_hwrite;
  wire [31:0]M_AHB_haddr;
  wire [2:0]M_AHB_hburst;
  wire [3:0]M_AHB_hprot;
  wire [31:0]M_AHB_hrdata;
  wire M_AHB_hready;
  wire M_AHB_hresp;
  wire [2:0]M_AHB_hsize;
  wire [1:0]M_AHB_htrans;
  wire [31:0]M_AHB_hwdata;
  wire M_AHB_hwrite;
  wire m_ahb_hclk;
  wire m_ahb_hclk_1;
  wire m_ahb_hmastlock;
  wire m_ahb_hmastlock_1;
  wire m_ahb_hresetn;
  wire m_ahb_hresetn_1;
  wire [1:0] register_set_0_hresp;
  wire [1:0] register_set_1_hresp;
  wire [31:0] register_set_1_reg0;
  wire [31:0] register_set_1_reg1;
  
  // YOUR CODE GOES IN HERE
  wire [1:0] TFTLCD_SW;
  // YOUR CODE GOES IN HERE

  TFTLCDCtrl TFTLCDCtrl_i (
      .CLK(TFTLCD_CLK),
      .nRESET(TFTLCD_nRESET),
      .TCLK(TFTLCD_TCLK),
      .Hsync(TFTLCD_Hsync),
      .Vsync(TFTLCD_Vsync),
      .DE_out(TFTLCD_DE_out),
      .R(TFTLCD_R),
      .G(TFTLCD_G),
      .B(TFTLCD_B),
      .Tpower(TFTLCD_Tpower),
      
      // YOUR CODE GOES IN HERE
      .SW(TFTLCD_SW),
      // YOUR CODE GOES IN HERE
      
      .BRAMCLK(BRAMCLK),
      .BRAMADDR(BRAMADDRA),
      .BRAMDATA(BRAMDATA)
  );
  
  bufferram
    bufferram_i (
      .clka( TFTLCD_CLK ),
      .ena(1'b1),
      .wea( 1'b0 ),
      .addra( BRAMADDRA ),
      .dina( 16'd0 ),
      .douta( BRAMDATA ));

assign TFTLCD_SW[0] = register_set_1_reg0[0];
assign TFTLCD_SW[1] = register_set_1_reg1[0];

assign LED[0] = register_set_1_reg0[0];
assign LED[1] = register_set_1_reg1[0];

endmodule
