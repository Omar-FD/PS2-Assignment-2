.ORIG	x3000
    AND R0, R0, #0
    AND R1, R1, #0
    AND R2, R2, #0
    AND R4, R4, #0

    GETP ; Getting Player Position
    ;Negating the height for subtraction
    ADD R4, R1, #-1
    NOT R4, R4
    ADD R4, R4, #1 ; One below player height
    REG

    GETH
    JSR CHECK_AND_REPLACE ; Calling Subroutine

    ADD R2, R2, #1 ; x+0, z+1
    GETH
    JSR CHECK_AND_REPLACE

    ADD R0, R0, #1 ; x+1, z+1
    GETH
    JSR CHECK_AND_REPLACE

    ADD R2, R2, #-1 ; x+1, z+0
    GETH
    JSR CHECK_AND_REPLACE


    ADD R2, R2, #-1 ; x+1, z-1
    GETH
    JSR CHECK_AND_REPLACE

    ADD R0, R0, #-1 ; x+0, z-1
    GETH
    JSR CHECK_AND_REPLACE

    ADD R0, R0, #-1 ; x-1, z-1
    GETH
    JSR CHECK_AND_REPLACE

    ADD R2, R2, #1 ; x-1, z+0
    GETH
    JSR CHECK_AND_REPLACE

    ADD R2, R2, #1 ; x-1, z+1
    GETH
    JSR CHECK_AND_REPLACE

    HALT

    CHECK_AND_REPLACE
        ADD R5, R4, R1 ; Checking to see if the height is less than the the block below player
        REG
        BRz END_CHECK ; If equal skip
        BRn ADDITION ; If negative, add blocks
        BRp REPLACE ; If positive, replace blocks

        ADDITION
            AND R3, R3, #0
            ADD R3, R3, #2 ;Add dirt block into R3
            ADD R1, R1, #1; Add 1 to y-axis
            SETB ; Set block
            GETH ;Get Height Again
            ADD R5, R4, R1
            BRz END_CHECK 
            BR ADDITION
        
        REPLACE
            REG
            AND R3, R3, #0
            SETB
            ; ADD R1, R1, #-1 ; Move down one block
            GETH
            ADD R5, R4, R1 ; Recheck height
            BRz END_CHECK
            BR REPLACE
        


       END_CHECK
    RET
.END