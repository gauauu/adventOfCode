.include "../framework/src/global.inc"

forward = 0
down = 1
up = 2

values:
;.byte forward,5, down,5, forward,8, up,3, down,8, forward,2
.byte forward,4,down,8,down,8,up,2,up,7,forward,5,forward,5,up,7,down,6,down,3,down,1,forward,5,forward,9,up,2,down,9,forward,4,up,5,forward,7,down,2,forward,7,down,2,forward,4,up,3,down,9,up,8,down,2,down,6,up,1,forward,3,down,6,down,2,forward,9,up,1,forward,5,down,1,forward,2,up,2,forward,4,down,3,down,8,up,2,down,3,up,4,down,8,forward,7,forward,9,down,7,down,1,forward,5,up,3,down,6,down,6,forward,1,down,9,forward,6,forward,9,forward,2,forward,5,forward,7,down,1,up,6,up,7,forward,8,forward,6,forward,2,down,5,up,3,up,4,down,9,up,4,down,9,up,4,down,5,forward,3,down,8,up,2,down,2,forward,7,down,7,forward,6,down,2,forward,5,down,1,forward,9,down,9,down,5,forward,2,forward,3,forward,6,forward,1,down,8,forward,2,forward,1,forward,9,down,8,forward,8,up,1,up,2,forward,2,forward,7,down,2,up,9,forward,5,forward,5,up,5,down,1,up,8,forward,3,up,5,forward,2,up,8,up,7,forward,4,down,6,up,1,up,6,forward,5,down,8,forward,4,down,7,forward,5,down,4,down,9,forward,2,down,5,down,2,down,3,forward,8,down,8,down,2,down,5,down,6,up,8,down,1,up,7,up,4,up,1,up,6,forward,6,forward,6,forward,8,up,5,forward,4,forward,5,forward,3,down,8,forward,9,forward,6,forward,6,up,1,up,8,forward,2,up,9,down,1,up,7,up,3,down,3,forward,2,down,5,up,8,forward,3,up,5,down,3,down,3,up,7,forward,2,forward,3,forward,6,forward,9,up,3,forward,1,up,9,down,8,forward,5,down,8,forward,9,down,1,forward,7,forward,9,forward,2,down,6,up,6,down,2,down,1,forward,7,down,3,forward,3,down,3,forward,1,forward,6,forward,1,down,4,down,4,down,5,forward,3,forward,1,up,8,forward,7,down,6,up,6,down,5,up,6,down,3,down,8,down,9,forward,2,up,8,forward,1,forward,2,forward,7,forward,5,up,6,down,9,up,9,forward,7,forward,6,forward,7,down,8,down,6,forward,5,down,2,down,5,down,3,down,4,up,5,down,5,forward,7,forward,2,down,1,forward,6,up,8,down,3,down,5,down,3,forward,3,up,2,forward,9,forward,2,up,4,down,3,down,7,forward,9,forward,6,up,1,up,2,down,5,up,8,forward,9,forward,2,down,3,down,6,up,3,down,9,down,2,up,4,down,3,up,7,forward,3,up,9,down,3,down,9,down,1,down,1,forward,7,down,9,forward,3,up,6,down,8,down,3,forward,7,forward,1,up,4,forward,8,forward,1,forward,9,up,9,forward,4,up,2,down,6,down,5,down,8,down,2,down,4,forward,5,down,8,down,1,forward,5,forward,9,down,4,forward,5,forward,4,forward,4,up,6,down,7,down,2,forward,8,down,7,forward,7,forward,7,forward,3,down,3,forward,6,down,5,down,5,forward,3,down,7,up,3,up,6,forward,8,down,3,down,6,forward,5,forward,4,down,4,down,3,down,1,down,4,down,2,forward,1,forward,5,down,9,forward,8,down,7,forward,4,down,5,down,5,forward,7,forward,9,down,5,down,8,up,9,forward,1,down,9,up,1,down,8,forward,4,up,8,up,7,down,4,forward,2,forward,9,up,9,forward,4,forward,5,forward,5,forward,4,forward,4,down,8,forward,3,forward,3,forward,1,forward,7,forward,7,up,2,forward,9,down,8,forward,3,down,3,down,3,down,4,forward,9,forward,9,forward,7,forward,9,down,6,forward,6,down,4,forward,7,down,3,forward,2,down,9,down,9,up,2,down,7,down,6,up,5,forward,6,forward,5,down,9,forward,8,down,9,forward,9,down,7,up,8,forward,5,forward,1,down,5,forward,1,down,4,up,6,up,1,down,5,forward,3,down,1,up,7,down,8,up,5,down,8,up,6,forward,6,down,8,up,2,forward,5,down,5,down,7,down,7,forward,8,forward,6,forward,2,forward,3,forward,3,forward,9,down,7,up,8,up,1,forward,8,down,5,down,7,forward,2,down,9,down,5,down,5,forward,6,forward,1,forward,8,down,3,down,3,down,7,up,3,down,3,down,5,down,1,forward,3,forward,2,forward,4,forward,1,forward,3,forward,6,down,6,down,4,forward,2,down,8,up,1,down,7,down,6,down,3,down,6,forward,8,up,7,down,7,up,7,down,1,forward,2,forward,9,up,8,down,2,down,3,down,7,down,2,up,2,down,1,down,7,up,6,down,4,forward,9,down,8,down,1,forward,5,forward,1,up,7,up,9,up,9,down,5,down,7,down,2,down,6,down,3,forward,8,forward,4,up,3,down,9,up,3,down,6,up,8,forward,7,down,7,up,5,down,1,down,3,up,4,forward,2,down,7,down,3,down,7,up,1,forward,8,down,3,forward,7,down,8,forward,5,forward,8,down,8,up,4,up,8,forward,3,down,7,up,6,down,9,forward,4,forward,4,forward,3,up,4,down,4,down,7,forward,6,down,7,down,8,up,5,down,4,up,6,up,6,up,4,down,7,forward,7,up,4,down,2,up,2,forward,6,down,5,down,1,forward,2,up,1,down,4,up,2,down,7,down,5,up,5,forward,6,up,2,forward,2,up,9,up,4,down,1,down,3,up,7,up,5,down,9,down,2,forward,9,down,1,up,9,down,4,down,8,forward,3,forward,1,forward,4,forward,9,down,5,down,5,down,8,up,4,up,1,down,9,up,4,forward,9,up,1,forward,7,down,4,up,2,down,1,forward,9,down,9,down,2,forward,8,up,2,forward,6,down,1,up,9,down,3,down,2,down,8,down,2,forward,8,forward,2,forward,8,down,3,up,6,forward,5,forward,4,forward,7,forward,1,down,8,forward,7,down,9,up,7,up,5,forward,1,down,6,down,6,up,9,up,9,up,1,forward,1,forward,5,up,1,forward,2,down,8,up,9,forward,2,forward,8,down,2,up,5,up,9,down,5,forward,2,forward,4,forward,2,up,7,down,9,forward,5,down,1,down,6,up,1,forward,8,down,1,down,7,up,2,forward,4,down,2,up,6,forward,6,forward,3,down,3,forward,2,down,2,up,9,forward,2,up,1,down,9,down,4,up,8,forward,3,down,9,down,9,forward,9,forward,8,up,8,down,8,up,8,forward,4,down,9,up,5,forward,8,up,6,forward,7,up,6,down,2,down,3,forward,9,forward,5,down,6,forward,9,down,5,down,9,down,7,down,9,down,3,forward,4,forward,2,down,2,down,7,down,7,up,2,up,3,forward,6,up,7,forward,4,down,3,forward,2,down,1,down,8,forward,5,down,3,up,9,forward,2,forward,7,down,4,forward,1,forward,8,forward,9,forward,5,down,4,up,3,up,9,forward,6,forward,4,forward,9,down,3,forward,1,forward,9,down,9,down,5,forward,9,forward,4,down,3,down,9,down,5,up,6,up,5,forward,5,up,8,down,3,forward,7,up,3,forward,9,down,8,forward,2,forward,1,forward,9,down,9,forward,1,down,6,forward,7,up,3,forward,7,up,3,down,1,forward,5,forward,5,up,3,forward,2,down,3,forward,8,up,9,forward,7,down,7,forward,5,up,4,forward,8,down,1,up,4,down,2,forward,2,down,5,down,5,up,2,forward,1,down,3,down,8,forward,6,forward,6,down,5,up,4,down,7,down,9,up,9,forward,7,forward,4,down,7,down,5,down,2,down,9,down,6,down,7,up,6,up,7,up,6,down,4,forward,9,down,8,down,7,down,8,down,4,forward,5,forward,1,up,5,forward,5,forward,4,down,3,forward,8,down,7,down,9,up,1,down,1,up,8,up,6,down,9,up,9,down,9,forward,7,down,3,forward,6,down,6,forward,6,down,9,down,7,up,1,down,2,up,2,down,3,down,1,up,4,forward,3,down,3,up,8,down,3,forward,3,forward,6,forward,6,forward,6,forward,7,up,2,forward,6,forward,1,up,4,up,7,down,5,down,9,forward,6,down,4,forward,6,down,7,down,2,up,9,up,3,forward,8,forward,5,down,1,down,6,down,7,down,5,up,3,up,9,forward,2,forward,5,down,3,down,2,up,2,forward,6,forward,3,down,8,forward,7,up,6,forward,4,down,8,forward,6,down,7,forward,9,forward,6,forward,2,forward,4,up,5,up,1,forward,3,forward,2,up,3,down,4,down,3,down,1,up,8,forward,6,down,4,down,9,down,3,up,8,down,5,forward,2,down,3,up,7,down,3,up,1,up,1,up,2,up,1,forward,4,forward,1,forward,4,forward,3,forward,8,down,8,up,5,down,4,down,4,down,6,down,9,down,7,forward,5,forward,3,up,3,forward,6,forward,5,forward,2,forward,6,up,4,forward,2,up,3,down,2,forward,3,down,8,forward,1,forward,2,down,3,down,5,forward,6,forward,3,forward,6,up,3,forward,5,forward,3,forward,5,down,6,down,4,down,4,forward,3,forward,3,up,6,up,8,forward,5,forward,1,down,3,down,8,down,9,up,3,down,7,forward,4,forward,2,down,2,up,6,down,1,down,8,forward,3,up,1,down,7,down,7,down,5,forward,3,down,8,forward,3,down,7,down,5,up,2,forward,9,down,8,down,5,forward,3,forward,2,forward,7,up,8,down,2,down,5,down,8,down,9,down,9,down,1,up,4,forward,5,up,1,up,4,forward,1,down,1,down,7,up,9,up,7,down,5,down,9,down,9,down,8,forward,7,down,3,up,4,down,7,down,8,forward,7,forward,4,up,9,down,2,up,7,forward,5,down,3,forward,3,forward,5,forward,5,down,2,down,2,down,7,up,8,up,9,down,1,forward,9,forward,3,up,3,forward,9,up,2,down,7,down,3,forward,4,down,5,down,3,up,5,forward,4
eof:

COMMAND = tempB
VAL = tempC

DEPTH = tempU16D
HORIZ = tempU16C



.export aoc_2a
.proc aoc_2a

  SET_U16 DEPTH,0
  SET_U16 HORIZ,0

  ;set pointer to the word list
  SET_U16 tempPtr,values

mainLoop:
  ;if we hit eof, we're done
  lda tempPtr+1
  cmp #>(eof)
  bne :+
  lda tempPtr
  cmp #<(eof)
  bne :+
    jmp done
:

  ;load command and value. 
  ; everything 8-bit values this time!
  ldy #0
  lda (tempPtr),y
  sta COMMAND
  iny
  lda (tempPtr),y
  sta VAL

  ;switch based on command
  lda COMMAND
  cmp #forward
  beq goForward
  cmp #up
  beq goUp
  cmp #down
  beq goDown
  ;;;never should get here!
  jmp displayError

goForward:
  ADD_16_8 HORIZ, VAL
  jmp next
goUp:
  SBC_16_8 DEPTH, VAL
  jmp next
goDown:
  ADD_16_8 DEPTH, VAL
  jmp next

next:

  ;go to next number
  ADD_16_CONST tempPtr, 2
  jmp mainLoop

done:
  MULT_16_16 HORIZ,DEPTH,5

  DISPLAY_ANSWER_32 5
  rts

.endproc


