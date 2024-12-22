;*****************************************************************
;* This stationery serves as the framework for a                 *
;* user application (single file, absolute assembly application) *
;* For a more comprehensive program that                         *
;* demonstrates the more advanced functionality of this          *
;* processor, please see the demonstration applications          *
;* located in the examples subdirectory of the                   *
;* Freescale CodeWarrior for the HC12 Program directory          *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

*****************************************************************
* Displaying battery voltage and bumper states (s19c32) *
*****************************************************************
; Definitions
LCD_DAT EQU PORTB       ;LCD data port, bits - PB7,...,PB0
LCD_CNTR EQU PTJ        ;LCD control port, bits - PE7(RS),PE4(E)
LCD_E EQU $80           ;LCD E-signal pin
LCD_RS EQU $40          ;LCD RS-signal pin

; Variable/data section
      ORG $3850
MotorStatus  RMB 1  ; Reserve 1 byte for motor status
LCDTemp      RMB 1  ; Reserve 1 byte for temporary LCD data
BumperState  RMB 1  ; Reserve 1 byte for bumper state
BatteryLevel RMB 1  ; Reserve 1 byte for battery level

; Code section
      ORG $4000
Entry:
_Startup:

************************************************************
* Motor Control *
************************************************************
      LDY #20000
      BSET DDRA,%00000011
      BSET DDRT,%00110000
      JSR PORTFWD
      JSR STARON
      JSR PORTON
      JSR STARFWD
      JSR del_50us 
      JSR del_50us
      JSR STARREV
      JSR PORTREV
      JSR del_50us
      JSR STAROFF
      JSR PORTOFF
      BRA *

;Subroutine
STARON  LDAA PTT
        ORAA #%00100000
        STAA PTT
        RTS

STAROFF LDAA PTT
        ANDA #%11011111
        STAA PTT
        RTS

PORTON  LDAA PTT
        ORAA #%00010000
        STAA PTT
        RTS
            
PORTOFF LDAA PTT
        ANDA #%11101111
        STAA PTT
        RTS

STARFWD LDAA PORTA
        ANDA #%11111101
        STAA PORTA
        RTS
            
STARREV LDAA PORTA
        ORAA #%00000010
        STAA PORTA
        RTS   

PORTFWD LDAA PORTA
        ANDA #%11111110
        STAA PORTA
        RTS

PORTREV LDAA PORTA
        ORAA #%00000001
        STAA PORTA
        RTS
        
*******************************************************************
* ([Y] x 50us)-delay subroutine. E-clk=41,67ns. *
*******************************************************************
del_50us:  PSHX ;2 E-clk
eloop:     LDX #30 ;2 E-clk -
iloop:     PSHA ;2 E-clk |
           PULA ;3 E-clk |
           PSHA ;2 E-clk | 
           PULA ;3 E-clk |
           PSHA ;2 E-clk |
           PULA ;3 E-clk |
           PSHA ;2 E-clk |
           PULA ;3 E-clk |
           PSHA ;2 E-clk |
           PULA ;3 E-clk |
           PSHA ;2 E-clk |
           PULA ;3 E-clk |
           NOP ;1 E-clk |
           NOP ;1 E-clk |
           DBNE X,iloop ;3 E-clk -
           DBNE Y,eloop ;3 E-clk
           PULX ;3 E-clk
           RTS ;5 E-clk
        
        
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
