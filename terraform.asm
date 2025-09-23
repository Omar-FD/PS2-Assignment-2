.ORIG	x3000
;Clear used regs
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
;Set the stone block in reg 1
ADD R3, R3, #1


JSR DIV_SUB


END_DIV
REG
HALT
NUMBER_TO_CONVERT   .FILL	#10

DIV_SUB
;Clearing the reg to store the number and one for the counter
    AND R4, R4, #0
    AND R5, R5, #0
    LD R4, NUMBER_TO_CONVERT

    DIV_ACT
    ADD R4, R4, #-2
    BRn END_DIV
    ADD R5, R5, #1
    BRp DIV_ACT

    RET


.END