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
.global buffer16BitDisplay
.global buffer32BitDisplay
.global displayError 

.globalzp ci,cj, tempPtr, tempA, tempB, tempC, tempD, tempU16, tempU16B, tempU16C, tempS16, tempS16B, tempS16C, tempU16D
.globalzp tempPtr2, tempPtr3
.globalzp tempU32A

.globalzp macroTemp


OAM = $200


.macro NEXT_BG
  sta text_buffer,x
  inx
.endmacro

.macro DISPLAY_ANSWER_16 u16
  lda u16
  sta 0
  lda u16+1
  sta 1
  jsr buffer16BitDisplay

.endmacro

.macro DISPLAY_ANSWER_32 u32
  lda u32
  sta 0
  lda u32+1
  sta 1
  lda u32+2
  sta 2
  lda u32+3
  sta 3
  jsr buffer32BitDisplay

.endmacro


.endif

.macro waitVBlank

  lda frameTick
:
  cmp frameTick
  beq :-

.endmacro 

.macro PPU_SCREEN_ON_MAIN
  ldx #0
  ldy #0
  lda #VBLANK_NMI|BG_0000|OBJ_1000
  sec
  jsr ppu_screen_on
.endmacro


.macro uploadOAM
 
  lda #0
  sta OAMADDR
  lda #>OAM
  sta OAM_DMA

.endmacro


.macro SET_U16 var,val
  lda #<val
  sta var
  lda #>val
  sta var+1
.endmacro


.macro SET_U32 var,lo,hi
  SET_U16 var,lo
  SET_U16 var+2,hi
.endmacro


.macro ADD_16_8 u16, u8
  lda u16
  clc
  adc u8
  sta u16
  lda u16+1
  adc #0
  sta u16+1
.endmacro

.macro SBC_16_8 u16, u8
  lda u16
  sec
  sbc u8
  sta u16
  lda u16+1
  sbc #0
  sta u16+1
.endmacro



.macro ADD_32_8 u32, u8
  lda u32
  clc
  adc u8
  sta u32

  lda u32+1
  adc #0
  sta u32+1

  lda u32+2
  adc #0
  sta u32+2

  lda u32+3
  adc #0
  sta u32+3

.endmacro

.macro SBC_32_8 u32, u8
  lda u32
  sec
  sbc u8
  sta u32

  lda u32+1
  sbc #0
  sta u32+1

  lda u32+2
  sbc #0
  sta u32+2

  lda u32+3
  sbc #0
  sta u32+3
.endmacro


.macro ADD_32_32 u32, bb
  lda u32
  clc
  adc bb
  sta u32

  lda u32+1
  adc bb+1
  sta u32+1

  lda u32+2
  adc bb+2
  sta u32+2

  lda u32+3
  adc bb+3
  sta u32+3

.endmacro



.macro ADD_16_CONST u16, val
  lda u16
  clc
  adc #<val
  sta u16
  lda u16+1
  adc #>val
  sta u16+1
.endmacro

.macro ADD_16_16 aa,bb
  lda aa
  clc
  adc bb
  sta aa
  lda aa+1
  adc bb+1
  sta aa+1
.endmacro

.macro ADD_32_16 aa,bb
  lda aa
  clc
  adc bb
  sta aa
  lda aa+1
  adc bb+1
  sta aa+1
  lda aa+2
  adc #0
  sta aa+2
  lda aa+3
  adc #0
  sta aa+3
.endmacro


.macro SIGN_EXTEND_A
	.local skip
		ora #$7F
		bmi skip
		lda #0
skip:
.endmacro



.macro ADD_U32_S16 u32,s16
  lda s16+1
  SIGN_EXTEND_A
  sta ci

  lda u32
  clc
  adc s16
  sta u32

  lda u32+1
  adc s16+1
  sta u32+1

  lda u32+2
  adc ci
  sta u32+2

  lda u32+3
  adc ci
  sta u32+3


.endmacro


.macro BEQ_16 u16,label

  .local nojmp
  lda u16
  bne nojmp
  lda u16+1
  bne nojmp
  jmp label
nojmp:

.endmacro

.macro BNE_16 u16,label

  lda u16
  bne label
  lda u16+1
  bne label
.endmacro




.macro MULT_16_16 aa,bb,result
  .local notZero
  .local loop
  .local done

  lda bb
  bne notZero
  lda bb+1
  bne notZero

  lda #0
  sta result
  sta result+1
  sta result+2
  sta result+3

  jmp done
notZero:
  COPY_16 bb,macroTemp


  SET_U32 result,0,0
loop:
  ADD_32_16 result,aa
  ADD_16_CONST macroTemp, -1
  BNE_16 macroTemp,loop

done:

.endmacro


.macro MULT_32_16 aa,bb,result

  .local notZero
  .local loop
  .local done

  lda bb
  bne notZero
  lda bb+1
  bne notZero
  lda #0
  sta result
  sta result+1
  sta result+2
  sta result+3

  jmp done
notZero:

  COPY_16 bb,macroTemp


  SET_U32 result,0,0
loop:
  ADD_32_32 result,aa
  ADD_16_CONST macroTemp, -1
  BNE_16 macroTemp,loop

done:

.endmacro


.macro LSR_16_BY_8 u16,u8
  .local done
  .local loop
  ldx u8
  beq done
loop:
  lsr u16+1
  ror u16
  dex
  bne loop
done:

 
.endmacro

.macro CMP_16 aa, bb
  .local done

  lda aa+1
  cmp bb+1
  bne done
  lda aa
  cmp bb
done:

.endmacro

.macro ASL_16_BY_8 u16, u8
  .local done
  .local loop
  ldx u8
  beq done
loop:
  asl u16
  rol u16+1
  dex
  bne loop
done:

.endmacro

.macro ORA_16 aa, bb
  lda aa
  ora bb
  sta aa
  lda aa+1
  ora bb+1
  sta aa+1

.endmacro

.macro INC_16 u16
  ADD_16_CONST u16,1
.endmacro

.macro CMP_16_CONST u16, val
 .local done
  lda u16+1
  cmp #>val
  bne done
  lda u16
  cmp #<val
done:

.endmacro

.macro COPY_16 from,to
  lda from
  sta to
  lda from+1
  sta to+1
.endmacro

.macro EOR_16_CONST u16, val
  lda u16
  eor #<val
  sta u16
  lda u16+1
  eor #>val
  sta u16+1

.endmacro
