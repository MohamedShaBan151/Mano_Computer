`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 06:15:59 AM
// Design Name: 
// Module Name: Computer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Computer(
output CLK           ,
output [7:0] INPR    ,
output R            ,  
output [7:0] commbus            ,  
output E            ,
output FGI          ,
output FGO          ,
output T0           ,
output T1           ,
output T2           ,
output T3           ,
output T4           ,
output T5           ,
output T6           ,
output T7           ,
output [7:0] ALU_out ,
output [2:0] AR     ,
output [2:0] PC     ,
output [7:0] AC     ,
output [7:0] DR     ,
output [7:0] TR     ,
output [7:0] RAM    ,
output [7:0] IR     ,
output [7:0] OUTPR

    );
    
wire path_clk       ;
wire path_R         ;
wire path_E         ;
wire path_j         ;
wire path_d0        ;
wire path_d1        ;
wire path_d2        ;
wire path_d3        ;
wire path_d4        ;
wire path_d5        ;
wire path_d6        ;
wire path_d7        ;
wire path_t0        ;
wire path_t1        ;
wire path_t2        ;
wire path_t3        ;
wire path_t4        ;
wire path_t5        ;
wire path_t6        ;
wire path_t7        ;
wire path_b0        ;
wire path_b1        ;
wire path_b2        ;
wire path_b3        ;
wire [7:0] path_INPR        ;
wire [2:0]  path_AR         ;
wire [2:0]  path_PC         ;
wire [7:0]  path_AC         ;
wire [7:0]  path_DR         ;
wire [7:0]  path_TR         ;
wire [7:0]  path_RAM_out    ;
wire [7:0]  path_IR         ;
wire [7:0]  path_OUTPR      ;
wire [7:0] path_alu_out     ;
wire [7:0] path_comm_bus    ; 

assign CLK    = path_clk          ;
assign INPR   = path_INPR         ;   
assign E      = path_E            ;
assign R      = path_R            ;
assign AR     = path_AR           ;
assign PC     = path_PC           ;
assign AC     = path_AC           ;
assign DR     = path_DR           ;
assign TR     = path_TR           ;
assign RAM    = path_RAM_out      ;
assign IR     = path_IR           ;
assign OUTPR  = path_OUTPR        ;
assign T0 = path_t0 ;
assign T1 = path_t1 ;
assign T2 = path_t2 ;
assign T3 = path_t3 ;
assign T4 = path_t4 ;
assign T5 = path_t5 ;
assign T6 = path_t6 ;
assign T7 = path_t7 ;
assign commbus = path_comm_bus ;
assign ALU_out =  path_alu_out ;

clk_generation test(
 .CLK(path_clk)

    );

  Secounce_Counter sc (
       . clk(path_clk),         
       . D0(path_d0), 
       . D1(path_d1),
       . D2(path_d2), 
       . D3(path_d3),
       . D4(path_d4),
       . D5(path_d5),
       . D6(path_d6), 
       . D7(path_d7),
       . J(path_j  ),
       . R(path_R  ),
       . B0(path_b0),
       . T0(path_t0),
       . T1(path_t1),
       . T2(path_t2),
       . T3(path_t3),
       . T4(path_t4),
       . T5(path_t5),
       . T6(path_t6),
       . T7(path_t7) 
       
    );
    
    
     Accumulator ac(
        . B2(path_b2),
        . D7(path_d7),
        . J(path_j  ),
        . T3(path_t3),
        . B1(path_b1),
        . D0(path_d0),
        . D1(path_d1),
        . D2(path_d2),
        . T5(path_t5),
        . B3(path_b3),
        . CLK(path_clk),
        . alu_out(path_alu_out),
        . AC(path_AC)
    );
    
    
    DR dr(
     . D0(path_d0), 
     . D1(path_d1),
     . D2(path_d2),
     . D6(path_d6), 
     . T4(path_t4),
     . T5(path_t5),
     . CLK(path_clk),
     . comm_bus(path_comm_bus),
     . DR(path_DR)
     
     );
     
      ALU alu (
    . clk(path_clk),
    . D0(path_d0), 
    . D1(path_d1),
    . D2(path_d2),
    . D7(path_d7),
    . B1(path_b1),
    . B2(path_b2),
    . B3(path_b3),
    . J(path_j),
    . T3(path_t3),
    . T5(path_t5),
    . DR(path_DR),
    . INPR(path_INPR ),
    . AC(path_AC),
    . alu_out(path_alu_out),
    . E(path_E)
 
     );
     
     Instruction_Register   ir(
      . CLK(path_clk),    
      . R(path_R),
      . T1(path_t1),
      . comm_bus(path_comm_bus),
      . IR(path_IR),
      . D0(path_d0), 
      . D1(path_d1),
      . D2(path_d2), 
      . D3(path_d3),
      . D4(path_d4),
      . D5(path_d5),
      . D6(path_d6), 
      . D7(path_d7), 
      . B0(path_b0),
      . B1(path_b1),
      . B2(path_b2),
      . B3(path_b3),
      . J(path_j)
     );
     
     CommonBus bus(
     . D0(path_d0), 
     . D1(path_d1),
     . D2(path_d2), 
     . D3(path_d3),
     . D4(path_d4),
     . D5(path_d5),
     . D6(path_d6), 
     . D7(path_d7), 
     . T0(path_t0),
     . T1(path_t1),
     . T2(path_t2),
     . T3(path_t3),
     . T4(path_t4),
     . T5(path_t5),
     . T6(path_t6),
     . R(path_R), 
     . B2(path_b2), 
     . J(path_j),
     . AC(path_AC),
     . DR(path_DR),
     . AR(path_AR),
     . PC(path_PC),
     . RAM_out(path_RAM_out),
     . IR(path_IR),
     . TR(path_TR),
     . comm_bus(path_comm_bus)
     
     );
     
      RAM ram( 
     . clk(path_clk),   
     . AR(path_AR),   
     . comm_bus(path_comm_bus) ,
     . R(path_R),
     . T1(path_t1),
     . T6(path_t6),
     . T4(path_t4),
     . D3(path_d3),
     . D5(path_d5),
     . D6(path_d6),    
     . RAM_out(path_RAM_out)
    );
    
    
     PC pc(
     .DR(path_DR),
    . D4(path_d4),
    . D5(path_d5),
    . D6(path_d6), 
    . T4(path_t4),
    . T5(path_t5),
    . T6(path_t6),
    . T1(path_t1),
    . T2(path_t2),
    . R(path_R),
    . CLK(path_clk), 
    . comm_bus(path_comm_bus) ,
    . PC(path_PC)
    );
    
      TR tr(
    . comm_bus(path_comm_bus) ,
    . T0(path_t0),
    . R(path_R),
    . CLK(path_clk), 
    . TR(path_TR)
    
    );
    
    
    
    
     AR ar(
    . D5(path_d5),
    . D7(path_d7),
    . T0(path_t0),
    . T2(path_t2),
    . T3(path_t3),
    . T4(path_t4),
    . J(path_j),
    . R(path_R),
    . CLK(path_clk), 
    . comm_bus(path_comm_bus) ,
    . AR(path_AR)
    );
    
     Interrupt IN(
     . T0(path_t0),
     . T1(path_t1),
     . T2(path_t2),
     . T3(path_t3),
     . D7(path_d7),
     . B2(path_b2),
     . B3(path_b3),
     . J(path_j  ),
     . FGO(FGO) ,
     . FGI(FGI) ,
     . CLK(path_clk), 
     . R(path_R)
    );
    
     OUTPR outpr(
    .comm_bus(path_comm_bus) ,
    .D7 (path_d7)  ,
    .T3 (path_t3)  ,
    .J (path_j)    ,
    .B2(path_b2)   ,
    .CLK(path_clk) , 
    .OUTPR(path_OUTPR) 
    
    );
    
    INPR inpr(
    .CLK(path_clk),
    .INPR(path_INPR),
    .INPR_in(INPR)
    
       );
    
    
endmodule
