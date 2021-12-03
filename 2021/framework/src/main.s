
.include "nes.inc"
.include "global.inc"


.segment "ZEROPAGE"
frameTick:          .res 1
oam_used:      .res 1  ; starts at 0

.segment "BSS"
text_buffer:   .res 16

.segment "CODE"

.proc nmi_handler
  inc frameTick
  rti
.endproc

.proc irq_handler
  rti
.endproc

.import aoc_1a
.import aoc_1b
.import aoc_2a
.import aoc_2b
.import aoc_3a
.import aoc_3b

.proc main

  jsr load_main_palette

  jsr draw_bg

  jsr aoc_3b
  jsr draw_updated_answer

  ldx oam_used
  jsr ppu_clear_oam

  PPU_SCREEN_ON_MAIN


  ;just spin on the answer....
:
  waitVBlank
  uploadOAM
  PPU_SCREEN_ON_MAIN
  ldx oam_used
  jsr ppu_clear_oam
  jmp :-

.endproc

