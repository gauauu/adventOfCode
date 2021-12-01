.ifndef GLOBAL_INC
.define GLOBAL_INC

.global reset_handler
.global main, nmi_handler, irq_handler
.globalzp cur_keys, new_keys, oam_used
.global draw_bg
.global draw_updated_answer

; ppuclear.s
.global ppu_clear_nt, ppu_clear_oam, ppu_screen_on

.global text_buffer
.global load_main_palette

.globalzp ci,cj, tempPtr, tempA, tempB, tempC, tempD, tempU16, tempU16B, tempU16C, tempS16, tempS16B, tempS16C, tempU16D


OAM = $200


.macro NEXT_BG
  sta text_buffer,x
  inx
.endmacro

.macro DISPLAY_ANSWER_16 u16
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

  lda u16+1
  clc
  lsr
  lsr
  lsr
  lsr
  clc
  adc #$30
  NEXT_BG

  lda u16+1
  and #$0f
  clc
  adc #$30
  NEXT_BG

  lda u16
  clc
  lsr
  lsr
  lsr
  lsr
  clc
  adc #$30
  NEXT_BG

  lda u16
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
.endmacro

.endif

.macro waitVBlank

  lda nmis
:
  cmp nmis
  beq :-

.endmacro 

.macro uploadOAM
 
  lda #0
  sta OAMADDR
  lda #>OAM
  sta OAM_DMA

.endmacro
