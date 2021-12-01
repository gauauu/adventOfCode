
# These are used in the title of the NES program and the zip file.
title = aoc21

AOCSRC = ../aoc-src
AOC = $(patsubst $(AOCSRC)/%.s, %, $(wildcard $(AOCSRC)/*.s))

OBJS = nrom init main bg ppuclear common $(AOC)
objlist = $(foreach o,$(OBJS),$(objdir)/$(o).o)


AS65 = ca65
LD65 = ld65
CFLAGS65 = --debug-info
objdir = obj/nes
srcdir = src
imgdir = gfx


.PHONY: run clean


$(title).nes: nrom128.cfg $(objlist)
	$(LD65) -o $(title).nes -m map.txt -Ln labels.txt --dbgfile $(title).dbg -C $^

clean:
	-rm -f $(objdir)/*.o $(objdir)/*.s $(objdir)/*.chr *.nes *.dbg map.txt labels.txt


$(objdir)/%.o: $(srcdir)/%.s $(srcdir)/nes.inc $(srcdir)/global.inc
	$(AS65) $(CFLAGS65) $< -o $@

$(objdir)/%.o: $(AOCSRC)/%.s $(srcdir)/nes.inc $(srcdir)/global.inc
	$(AS65) $(CFLAGS65) $< -o $@

$(objdir)/%.o: $(objdir)/%.s
	$(AS65) $(CFLAGS65) $< -o $@

$(objdir)/main.o: $(objdir)/bg.chr 

$(title).chr: $(objdir)/bg.chr 
	cat $^ > $@

$(objdir)/%.chr: $(imgdir)/%.png
	tools/pilbmp2nes.py $< $@



