module rgb(R,G,B,H_COUNT,V_COUNT,DE,RESET);
    
    input [9:0] H_COUNT;
    input [9:0] V_COUNT;
    input DE;
    input RESET;
    
    output reg [7:3] R;
    output reg [7:2] G;
    output reg [7:3] B;
    

    always@(DE,H_COUNT,V_COUNT,RESET) begin
        if(RESET == 1) begin
            R = 0;
            G = 0;
            B = 0;
        end
        
        else if(DE == 1) begin
            if(H_COUNT >= 10'd1) begin
                if ((V_COUNT > 10'd11) && (V_COUNT <= 10'd45)) begin	/* white */ 
                    R = 5'b11111;
                    G = 6'b111111;
                    B = 5'b111111;
                end

                else if ((V_COUNT > 10'd45) && (V_COUNT <= 10'd79)) begin 	/* yellow */                
                    R = 5'b11111;
                    G = 6'b111111;
                    B = 0;
                end

                else if ((V_COUNT > 10'd79) && (V_COUNT <= 10'd113)) begin 	/* cyan */
                    R = 0;
                    G = 6'b111111;
                    B = 5'b11111;
                end

                else if ((V_COUNT > 10'd113) && (V_COUNT <= 10'd147)) begin	/* green */
                    R = 0;
                    G = 6'b111111;
                    B = 0;
                end
                
                else if ((V_COUNT > 10'd147) && (V_COUNT <= 10'd181)) begin    /* purple */
                    R = 5'b11111;
                    G = 0;
                    B = 5'b11111;
                end

                else if ((V_COUNT > 10'd181) && (V_COUNT <= 10'd215)) begin   /* red */
                    R = 5'b11111;
                    G = 0;
                    B = 0;
                end  

                else if ((V_COUNT > 10'd215) && (V_COUNT <= 10'd249)) begin     /* blue */
                    R = 0;
                    G = 0;
                    B = 5'b11111;
                end

                else if ((V_COUNT > 10'd249) && (V_COUNT <= 10'd283)) begin    /* white */
                    R = 5'b11111;
                    G = 6'b111111;
                    B = 5'b11111;
                end

                else begin
                    R = 0;
                    G = 0;
                    B = 0;
                end
            end
        end
        
        else begin
            R = 0;
            G = 0;
            B = 0;
        end
                       
    end
                   
endmodule