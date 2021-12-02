
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

.proc main

  ; Now the PPU has stabilized, and we're still in vblank.  Copy the
  ; palette right now because if you load a palette during forced
  ; blank (not vblank), it'll be visible as a rainbow streak.
  jsr load_main_palette

  jsr draw_bg

  jsr aoc_2a
  jsr draw_updated_answer

  ldx oam_used
  jsr ppu_clear_oam

  PPU_SCREEN_ON_MAIN


forever:

  waitVBlank
  PPU_SCREEN_ON_MAIN
  jmp forever

.endproc

