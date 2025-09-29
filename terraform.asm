.ORIG	x3000
;Clear used regs
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
;Set the stone block in reg 3
ADD R3, R3, #1


LD R4, NUMBER_TO_CONVERT
JSR DIV_SUB


END_DIV
REG
HALT
NUMBER_TO_CONVERT   .FILL	#41

DIV_SUB
;Clearing the reg to store the number and one for the counter
    ADD R5, R4, #-2
    BRn END_DIV

    ADD R4, R4, #-2

    ADD R6, R6, #1
    BR DIV_SUB
    RET


.END