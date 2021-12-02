.include "nes.inc"
.include "global.inc"

aoc_header:
.byte "advent of code"
.byte 255

.segment "CODE"
.proc draw_bg
  ldx #$20
  lda #$00
  ldy #$AA
  jsr ppu_clear_nt

  ; Draw a label
  lda #$20
  sta PPUADDR
  lda #$49
  sta PPUADDR

  ldx #0
titleLoop:
  lda aoc_header,x
  cmp #255
  beq :+
  sec
  sbc #$20
  sta PPUDATA
  inx
  bne titleLoop
:

  rts
.endproc

.proc displayError
  lda #9
  sta 0
  sta 1
  ;purposefully fall through

.endproc

.export buffer16BitDisplay
.proc buffer16BitDisplay

  ldx #0
  lda #0

  NEXT_BG
  NEXT_BG
  NEXT_BG
  NEXT_BG
  NEXT_BG

  lda #$30
  NEXT_BG
  lda #$5f
  NEXT_BG

  lda 1
  clc
  lsr
  lsr
  lsr
  lsr
  clc
  adc #$30
  NEXT_BG

  lda 1
  and #$0f
  clc
  adc #$30
  NEXT_BG

  lda 0
  clc
  lsr
  lsr
  lsr
  lsr
  clc
  adc #$30
  NEXT_BG

  lda 0
  and #$0f
  clc
  adc #$30
  NEXT_BG

  lda #0
  NEXT_BG
  NEXT_BG
  NEXT_BG
  NEXT_BG
  NEXT_BG
  NEXT_BG
  NEXT_BG

.endproc



.export buffer32BitDisplay
.proc buffer32BitDisplay

  ldx #0
  lda #0

  NEXT_BG
  NEXT_BG
  NEXT_BG

  lda #$30
  NEXT_BG
  lda #$5f
  NEXT_BG


  lda 3
  clc
  lsr
  lsr
  lsr
  lsr
  clc
  adc #$30
  NEXT_BG

  lda 3
  and #$0f
  clc
  adc #$30
  NEXT_BG

  lda 2
  clc
  lsr
  lsr
  lsr
  lsr
  clc
  adc #$30
  NEXT_BG

  lda 2
  and #$0f
  clc
  adc #$30
  NEXT_BG



  lda 1
  clc
  lsr
  lsr
  lsr
  lsr
  clc
  adc #$30
  NEXT_BG

  lda 1
  and #$0f
  clc
  adc #$30
  NEXT_BG

  lda 0
  clc
  lsr
  lsr
  lsr
  lsr
  clc
  adc #$30
  NEXT_BG

  lda 0
  and #$0f
  clc
  adc #$30
  NEXT_BG

  lda #0
  NEXT_BG
  NEXT_BG
  NEXT_BG
  NEXT_BG
  NEXT_BG

.endproc


.proc draw_updated_answer
  lda #$20
  sta PPUADDR
  lda #$A7
  sta PPUADDR
  ldx #0
:
  lda text_buffer,x
  sta PPUDATA
  inx
  lda text_buffer,x
  sta PPUDATA
  inx
  lda text_buffer,x
  sta PPUDATA
  inx
  lda text_buffer,x
  sta PPUDATA
  inx

  cpx #16
  bne :-
  
  rts

.endproc


.export load_main_palette
.proc load_main_palette
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR
copypalloop:
  lda pal,x
  sta PPUDATA
  inx
  cpx #32
  bcc copypalloop
  rts
.endproc

.segment "RODATA"
pal:
  .byt $0f,$18,$28,$38,$0F,$06,$16,$26,$0F,$08,$19,$2A,$0F,$02,$12,$22
  .byt $0f,$08,$16,$37,$0F,$06,$16,$26,$0F,$0A,$1A,$2A,$0F,$02,$12,$22

.segment "CHR"
  .incbin "obj/nes/bg.chr"
