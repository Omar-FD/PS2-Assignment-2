.ORIG	x3000
    AND R0, R0, #0
    AND R1, R1, #0
    AND R2, R2, #0
    AND R4, R4, #0

    GETP ; Getting Player Position
    ;Negating the height for subtraction
    ADD R4, R1, #0
    NOT R4, R4

    ADD R0, R0, #1
    GETH
    REG
    JSR CHECK_AND_REPLACE ; Calling Subroutine
    
    HALT

    CHECK_AND_REPLACE
        ADD R5, R4, R1
        REG
    RET
.END