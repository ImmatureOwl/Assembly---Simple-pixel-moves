;.define pos $67
.org $8000

LDY $67
;clear screen function
clr_screen:
LDA #0
STA $0200, Y
RTS

;check for inputs
check_input:
LDA $4000
CMP #$01 ;mv up
BEQ mv_up
CMP #$02 ;mv down
BEQ mv_down
CMP #$04 ;mv left
BEQ mv_left
CMP #08 ;mv right
BEQ mv_right
RTS

;move up
mv_up:
JSR clr_screen
TYA
ADC #$ef
TAY
RTS

;move down
mv_down:
JSR clr_screen
TYA
ADC #$0F
TAY
RTS

;move left
mv_left:
JSR clr_screen
DEY
RTS

;move right
mv_right:
JSR clr_screen
INY
RTS

;print pixel
print:
LDA #05
STA $0200, Y
RTS

;MAIN FUNCTION
start:
JSR check_input
JSR print
JMP start

.goto $FFFA
.dw start ; non maskable
.dw start ; reset
.dw start ; interrupt