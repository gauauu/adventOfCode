
.include "nes.inc"
.include "global.inc"


.segment "ZEROPAGE"
nmis:          .res 1
oam_used:      .res 1  ; starts at 0
cur_keys:      .res 2
new_keys:      .res 2

.segment "BSS"
text_buffer:   .res 16

.segment "CODE"

.proc nmi_handler
  inc nmis
  rti
.endproc

.proc irq_handler
  rti
.endproc

.import aoc_1a
.import aoc_1b

.proc main

  ; Now the PPU has stabilized, and we're still in vblank.  Copy the
  ; palette right now because if you load a palette during forced
  ; blank (not vblank), it'll be visible as a rainbow streak.
  jsr load_main_palette

  jsr draw_bg

  jsr aoc_1b
  jsr draw_updated_answer

  ldx oam_used
  jsr ppu_clear_oam

  ; Turn the screen on
  ldx #0
  ldy #0
  lda #VBLANK_NMI|BG_0000|OBJ_1000
  sec
  jsr ppu_screen_on


forever:


  waitVBlank

  
  ; Turn the screen on
  ldx #0
  ldy #0
  lda #VBLANK_NMI|BG_0000|OBJ_1000
  sec
  jsr ppu_screen_on
  jmp forever

; And that's all there is to it.
.endproc

