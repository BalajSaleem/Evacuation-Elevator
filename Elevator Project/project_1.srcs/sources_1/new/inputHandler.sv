module inputHandler(input clk,input [3:0] keyb_col, output logic [3:0] psngr1,psngr2,psngr3,output [3:0] keyb_row) 
    ;
    
            logic[3:0] key_value;
            logic key_valid;
            keypad4X4 keypad4X4_inst0(
                .clk(clk),
                .keyb_row(keyb_row), // just connect them to FPGA pins, row scanner
                .keyb_col(keyb_col), // just connect them to FPGA pins, column scanner
                .key_value(key_value), //user's output code for detected pressed key: row[1:0]_col[1:0]
                .key_valid(key_valid)  // user's output valid: if the key is pressed long enough (more than 20~40 ms), key_valid becomes '1' for just one clock cycle.
            );    
            
              always_ff @(posedge clk)
                begin
                
                
                
                if(key_valid)
                begin
                    if(key_value == 4'b1100 & psngr3 < 4'b1101)
                    begin
                    psngr3 <= psngr3+4'b0001;
                    end
                    
                    if(key_value == 4'b1101 & psngr3 > 4'b0000)
                    begin
                    psngr3 <= psngr3-4'b0001;
                    end
                    
                    if(key_value == 4'b1001 & psngr2 < 4'b1101)
                    begin
                    psngr2 <= psngr2+4'b0001;
                    end
                    
                    if(key_value == 4'b1000 & psngr2 > 4'b0000)
                    begin
                    psngr2 <= psngr2-4'b0001;
                    end
                    
                    if(key_value == 4'b0100 & psngr1 < 4'b1101)
                    begin
                    psngr1 <= psngr1+4'b0001;
                    end
                    
                    if(key_value == 4'b0101 & psngr1 > 4'b0000)
                    begin
                    psngr1 <= psngr1-4'b0001;
                    end
                                        
                end

                
                
                end 
    
    
    
    
    
endmodule