.include "../framework/src/global.inc"

values:
.word 199,200,208,210,200,207,240,269,260,263
eof:

.export aoc_1a
.proc aoc_1a
  ;initalize count
  lda #0
  sta tempU16D
  sta tempU16D+1

  ;set pointer to the word list
  lda #<values
  sta tempPtr
  lda #>values
  sta tempPtr+1

mainLoop:
  ;if we're on the 2nd to last entry, we're done
  lda tempPtr+1
  cmp #>(eof-2)
  bne :+
  lda tempPtr
  cmp #<(eof-2)
  bne :+
    jmp done
:

  ;load current and next
  lda (tempPtr),y
  sta tempU16B
  iny
  lda (tempPtr),y
  sta tempU16B+1
  iny
  lda (tempPtr),y
  sta tempU16C
  iny
  lda (tempPtr),y
  sta tempU16C+1

  ;compare next and current
  lda tempU16C+1
  cmp tempU16B+1
  beq :+
  bcs isHigher
  bcc isNotHigher
:
  lda tempU16C
  cmp tempU16B
  beq isNotHigher
  bcs isHigher
  jmp isNotHigher

isHigher:
  ;increase the count
  clc
  lda tempU16D
  adc #1
  sta tempU16D
  lda tempU16D+1
  adc #0
  sta tempU16D+1
  
isNotHigher:

  ;go to next number
  clc
  lda tempPtr
  adc #2
  sta tempPtr
  lda tempPtr+1
  adc #0
  sta tempPtr+1
  jmp mainLoop

done:

  DISPLAY_ANSWER_16 tempU16D
  rts

.endproc



.export aoc_1b
.proc aoc_1b
  ;initalize count
  lda #0
  sta tempU16D
  sta tempU16D+1

  ;set pointer to the word list
  lda #<values
  sta tempPtr
  lda #>values
  sta tempPtr+1

mainLoop:
  ;if we're on the 3rd to last entry, we're done
  lda tempPtr+1
  cmp #>(eof-(2 * 3))
  bne :+
  lda tempPtr
  cmp #<(eof-(2 * 3))
  bne :+
    jmp done
:

  ;load current and next
  ldy #0
  jsr getWindow
  sta tempU16B
  stx tempU16B+1

  ldy #2

  jsr getWindow
  sta tempU16C
  stx tempU16C+1

  ;compare next and current
  lda tempU16C+1
  cmp tempU16B+1
  beq :+
  bcs isHigher
  bcc isNotHigher
:
  lda tempU16C
  cmp tempU16B
  beq isNotHigher
  bcs isHigher
  jmp isNotHigher

isHigher:
  ;increase the count
  clc
  lda tempU16D
  adc #1
  sta tempU16D
  lda tempU16D+1
  adc #0
  sta tempU16D+1
  
isNotHigher:

  ;go to next number
  clc
  lda tempPtr
  adc #2
  sta tempPtr
  lda tempPtr+1
  adc #0
  sta tempPtr+1
  jmp mainLoop

done:

  DISPLAY_ANSWER_16 tempU16D
  rts

getWindow:
  lda (tempPtr),y
  sta 0
  iny
  lda (tempPtr),y
  sta 1
  iny

  ;pre-load these first because we might carry
  ; while incrementing y
.repeat 2
  lda (tempPtr),y
  sta 2
  iny
  lda (tempPtr),y
  sta 3
  iny

  lda 2
  clc
  adc 0
  sta 0

  lda 3
  adc 1
  sta 1
.endrepeat

  lda 0
  ldx 1
  rts

.endproc
