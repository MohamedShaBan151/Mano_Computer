`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 12:29:01 PM
// Design Name: 
// Module Name: Computer_tp
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


module Computer_tp ;
wire CLK         ;   
reg [7:0] INPR   ;
wire R           ;
wire T0          ;
wire T1          ;
wire T2          ;
wire T3          ;
wire T4          ;
wire T5          ;
wire T6          ;
wire T7          ;
wire [7:0] ALU_out ;
wire [7:0] RAM   ;
wire [2:0] AR    ;
wire [2:0] PC    ;
wire [7:0] IR    ;
wire [7:0] DR    ;
wire [7:0] AC    ;
wire [7:0] OUTPR ;
wire [7:0] TR    ;
wire FGI         ;
wire FGO         ;
wire E           ;
wire [7:0] commbus  ;

Computer cr (
.CLK   (CLK   ) ,
.INPR  (INPR  ) ,
.R     (R     ) ,
.T0    (T0    ) ,
.T1    (T1    ) ,
.T2    (T2    ) ,
.T3    (T3    ) ,
.T4    (T4    ) ,
.T5    (T5    ) ,
.T6    (T6    ) ,
.T7    (T7    ) ,
.ALU_out (ALU_out),
.RAM   (RAM   ) ,
.AR    (AR    ) ,
.PC    (PC    ) ,
.IR    (IR    ) ,
.DR    (DR    ) ,
.AC    (AC    ) ,
.OUTPR (OUTPR ) ,
.TR    (TR    ) ,
.FGI   (FGI   ) ,
.FGO   (FGO   ) ,
.E     (E     ), 
.commbus (commbus )
);



initial 
  begin 

  #100 ;
$finish ;
  end
  
endmodule
