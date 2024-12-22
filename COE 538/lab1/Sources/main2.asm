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

MULTIPLICAND FCB 05 ; First Number
MULTIPLIER FCB 04 ; Second Number
PRODUCT RMB 2 ; Result of addition

; code section
            

;**************************************************************
;*                 Actual Program Starts Here                 *
;**************************************************************
            ORG   $4000
Entry:
_Startup:
            LDAA MULTIPLICAND   ; Get the first number into ACCA
            LDAB MULTIPLIER     ; Get Second Number into ACCB
            MUL                 ; Multiply it to it the second number
            STD PRODUCT         ; and store the sum
            SWI                 ; break to the monitor
            
           
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG $FFFE
            FDB Entry ; Reset Vector
