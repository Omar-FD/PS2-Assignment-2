.ORIG	x3000
    AND R0, R0, #0
    AND R1, R1, #0
    AND R2, R2, #0

    GETP
    GETH
    NOT R1, R1
    ADD R1, R1, #1

    STI R1, REF_HEIGHT ; Storing 

    
    ADD R2, R2, #1 ; x+0, z+1
    GETH
    JSR CHECK_AND_REPLACE

    ADD R0, R0, #1 ; x+1, z+1
    GETH
    JSR CHECK_AND_REPLACE

    ADD R2, R2, #-1; x+1, z+0
    GETH
    JSR CHECK_AND_REPLACE

    ADD R2, R2, #-1; x+1, z-1
    GETH
    JSR CHECK_AND_REPLACE

    ADD R0, R0, #-1; x+0, z-1
    GETH
    JSR CHECK_AND_REPLACE
    
    ADD R0, R0, #-1; x-1, z-1
    GETH
    JSR CHECK_AND_REPLACE

    ADD R2, R2, #1; x-1, z+0
    GETH
    JSR CHECK_AND_REPLACE

    ADD R2, R2, #1; x-1, z+1
    GETH
    JSR CHECK_AND_REPLACE

    HALT

    REF_HEIGHT      .FILL	x3010

    CHECK_AND_REPLACE
        
.END