.ORIG	x3000
;Clear used regs
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
;Set the stone block in reg 3
ADD R3, R3, #1
GETP


LD R4, NUMBER_TO_CONVERT

    DIV_SUB ; Division Algorithm
    ;Clearing the reg to store the number and one for the counter
        AND R5, R5, #0
        ADD R5, R4, #-2
        BRn EXIT

        ADD R4, R4, #-2

        ADD R6, R6, #1
        BRnzp DIV_SUB
    EXIT
    JSR BIN_SUB
    REG
    AND R4, R4, #0
    ADD R4, R4, R6
    REG
    AND R6, R6, #0
    ADD R4, R4, #0
BRp DIV_SUB

HALT
NUMBER_TO_CONVERT   .FILL	#237

BIN_SUB
    ADD R2, R2, #1
    ADD R4, R4, #0
    BRnz SKIP_BLOCK
    SETB
    SKIP_BLOCK
RET




.END