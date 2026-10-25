// Transcribed from the author's Week 15 result report, Listing 1.
// Fragment: surrounding seven_seg module and register declarations are absent.
// The original fragment does not show reset logic.
always @(posedge clk) begin
    if (clk_cnt == 26'd49999999) begin
        clk_cnt <= 0;
        led_idx <= led_idx + 1'b1;
    end else clk_cnt <= clk_cnt + 1'b1;
end
always @(*) begin
    case (led_idx)
        2'd0: led_out = LEDDATA[7:0];
        2'd1: led_out = LEDDATA[15:8];
        2'd2: led_out = LEDDATA[23:16];
        2'd3: led_out = LEDDATA[31:24];
    endcase
end
