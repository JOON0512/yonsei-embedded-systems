/* Transcribed from the author's Week 15 result report, Listing 3.
 * Fragment only; requires the surrounding test application.
 * Student-number display data replaced with a neutral example. */
#define LED_VALUE 0x87654321LLU
#define SEG_VALUE 0x12345678LLU
wr_short_value = SEG_VALUE;
wr_len = write(device_ctrl, &wr_short_value, sizeof(unsigned));
rd_len = read(device_ctrl, &rd_short_value, sizeof(unsigned));
wr_long_value = (LED_VALUE << 32LLU) | SEG_VALUE;
wr_len = write(device_ctrl, &wr_long_value, sizeof(unsigned long long));
rd_len = read(device_ctrl, &rd_long_value, sizeof(unsigned long long));
