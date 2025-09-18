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
ADD R3, R0, R3
REG

;|playerpos.x - G_X|
BRzp NO_X_NEGATION
NOT R3, R3
ADD R3, R3, #1

;Get negative G_Y
AND R4, R4, #0
LD R4, G_Y
NOT R4, R4
ADD R4, R4, #1

NO_X_NEGATION

;playerpos.y - G_Y
ADD R4, R1, R4
REG

;|playerpos.y - G_Y|
BRzp NO_Y_NEGATION
NOT R4, R4
ADD R4, R4, #1

NO_Y_NEGATION

;Get negative G_Z
AND R5, R5, #0
LD R5, G_Z
NOT R5, R5
ADD R5, R5, #1

;playerpos.z - G_Z
ADD R5, R2, R5

;|playerpos.z - G_Z|
BRzp NO_Z_NEGATION
NOT R5, R5
ADD R5, R5, #1

NO_Z_NEGATION

;Get the Dmanhattan
AND R6, R6, #0
ADD R6, R3, R4
ADD R6, R6, R5

;Compare the manhattan distance with the Goal Dist by making goal dist negative and adding

;Make Goal_dist negative
AND R7, R7, #0
LD R7, GOAL_DIST
NOT R7, R7
ADD R7, R7, #1

;Perform the subtraction
ADD R7, R6, R7
BRp OUTSIDE_BOUNDS
AND R0, R0, #0
LEA R0, INBOUNDS
CHAT
BRnzp SKIP

OUTSIDE_BOUNDS
AND R0, R0, #0
LEA R0, OUTBOUNDS
CHAT

SKIP
REG
HALT

INBOUNDS    .STRINGZ "The player is within distance of the goal \n"
OUTBOUNDS   .STRINGZ "The player is outside the goal bounds \n"
G_X         .FILL   #100
G_Y         .FILL   #100    
G_Z         .FILL   #100
GOAL_DIST   .FILL   #200

.END