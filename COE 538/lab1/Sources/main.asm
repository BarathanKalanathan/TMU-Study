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

;**************************************************************
;*                 Code Section                         *
;**************************************************************

            ORG $3000

FIRSTNUM FCB 01 ; First Number
SECNUM FCB 02 ; Second Number
SUM RMB 1 ; Result of addition

; code section
            

;**************************************************************
;*                 Actual Program Starts Here                 *
;**************************************************************
            ORG   $4000
Entry:
_Startup:
            LDAA FIRSTNUM   ; Get the first number into ACCA
            ADDA SECNUM     ; Add to it the second number
            STAA SUM        ; and store the sum
            SWI             ; break to the monitor
            
           
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG $FFFE
            FDB Entry ; Reset Vector
