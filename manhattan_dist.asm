.ORIG	x3000
;Ensuring all the registers are clean
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0

;The formula for manhattan distance: d = |playerpos.x - G_X | + | playerpos.y - G_Y | + | playerpos.Z - G_Z|
GETP ; Get Player Pos
REG ; Disp Reg content

;Get Negative G_X and set it in R3
ADD R3, R3, #0
LD R3, G_X
NOT R3, R3
ADD R3, R3, #1

;Add the playerpos.x && negated G_X
ADD R3, R3, R0
REG

;Get the absolute value
BRzp NO_NEGATION
NOT R3, R3
ADD R3, R3, #1

NO_NEGATION
REG

HALT
INBOUNDS    .STRINGZ "The player is within distance of the goal\n"
OUTBOUNDS   .STRINGZ "The player is outside the goal bounds\n"
G_X         .FILL   #100
G_Y         .FILL   #100    
G_Z         .FILL   #100
GOAL_DIST   .FILL   #200

.END