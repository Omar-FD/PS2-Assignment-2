.ORIG	x3000
;Ensuring all the registers are clean
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0

;The formula for manhattan distance: d = |playerpos.x - G_X | + | playerpos.y - G_Y | + | playerpos.Z - G_Z|



HALT

G_X         .FILL #340
G_Y         .FILL #200    
G_Z         .FILL   #10
GOAL_DIST   .FILL   

.END