roms := \
	pokered.gbc \
	pokeblue.gbc \
	pokegreen.gbc \
	pokered_origback.gbc \
	pokeblue_origback.gbc \
	pokebluejp.gbc \
	pokeredjp.gbc \
	pokebluejp_origback.gbc

rom_obj := \
	audio.o \
	main.o \
	text.o \
	wram.o \

pokered_obj := $(rom_obj:.o=_red.o)

pokered_obj := $(rom_obj:.o=_red.o)
pokeblue_obj := $(rom_obj:.o=_blue.o)
pokegreen_obj := $(rom_obj:.o=_green.o)
pokered_origback_obj := $(rom_obj:.o=_red_origback.o)
pokeblue_origback_obj := $(rom_obj:.o=_blue_origback.o)
pokebluejp_obj := $(rom_obj:.o=_bluejp.o)
pokeredjp_obj := $(rom_obj:.o=_redjp.o)
pokebluejp_origback_obj := $(rom_obj:.o=_bluejp_origback.o)

### Build tools

MD5 := md5sum -c

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: all red blue green red_origback blue_origback bluejp redjp bluejp_origback clean tidy compare tools

all: $(roms)
red: pokered.gbc
blue: pokeblue.gbc
green: pokegreen.gbc
bluejp: pokebluejp.gbc
redjp: pokeredjp.gbc

# For contributors to make sure a change didn't affect the contents of the rom.
compare: $(roms)
	@$(MD5) roms.md5

clean:
	rm -f $(roms) $(pokered_obj) $(pokeblue_obj) $(pokegreen_obj) $(pokered_origback_obj) $(pokeblue_origback_obj) $(pokebluejp_obj) $(pokeredjp_obj) $(pokebluejp_origback_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' \) -exec rm {} +
	$(MAKE) clean -C tools/

tidy:
	rm -f $(roms) $(pokered_obj) $(pokeblue_obj) $(pokegreen_obj) $(pokered_origback_obj) $(pokeblue_origback_obj) $(pokebluejp_obj) $(pokeredjp_obj) $(pokebluejp_origback_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)
	$(MAKE) clean -C tools/

tools:
	$(MAKE) -C tools/


# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))
$(info $(shell $(MAKE) -C tools))
endif


%.asm: ;

# _RED, _BLUE, and _GREEN are the base rom tags. You can only have one of these.
# _SWBACKS modifies any base rom. It uses spaceworld 48x48 back sprites.

# _SWSPRITES modifies any base rom but cannot be used with other _*SPRITES tags. It uses spaceworld front 'mon sprites.
# _YSPRITES modifies any base rom but cannot be used with other _*SPRITES tags. It uses yellow front 'mon sprites.
# _RGSPRITES modifies any base rom but cannot be used with other _*SPRITES tags. It uses redjp/green front 'mon sprites.

# _REDGREENJP modifies _RED or _GREEN. It reverts back certain aspects that were shared between japanese red & green.
# _BLUEJP modifies _BLUE. It reverts back certain aspects that were unique to japanese blue.
# _REDJP modifies _RED. It is for minor things exclusive to japanese red.

# _JPTXT modifies any base rom. It restores some japanese text translations that were altered in english.
# _JPLOGO modifies any base rom. It builds a japanese-style title screen logo.
# _RGTITLE modifies any base rom. It builds a red-jp/green-style title screen layout and presentation.
# _METRIC modifies any base rom. It converts the pokedex data back to metric units.

# _FPLAYER modifies any base rom. It includes code to support a female trainer player option.
# _MOVENPCS adds move deleter and relearner NPCs in a Saffron house.
# _RUNSHOES Allows player to run by holding B
# _EXPBAR Adds an EXP bar to the battle UI

# -D _JPFLASHING modifies any base rom. It restores flashing move animations that were in japanese red and green.
# !!WARNING!! The flashing of the restored moves may be harmful to those with photosensitivity or epilepsy.
# This tag would normally be added to the GREEN and RED_JP roms, but it remains inactive by default for safety.
# Please act responsibly should you choose to compile using this tag.
# Dev Note: The added flashing can become quite displeasing regardless. Leaving it out makes for a better experience.

%_red.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
$(pokered_obj): %_red.o: %.asm $$(dep)
	$(RGBASM) -D _RED -D _SWBACKS -D _FPLAYER -D _MOVENPCS -D _RUNSHOES -D _EXPBAR -h -o $@ $*.asm

%_blue.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
$(pokeblue_obj): %_blue.o: %.asm $$(dep)
	$(RGBASM) -D _BLUE -D _SWBACKS -D _FPLAYER -D _MOVENPCS -D _RUNSHOES -D _EXPBAR -h -o $@ $*.asm

%_green.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
$(pokegreen_obj): %_green.o: %.asm $$(dep)
	$(RGBASM) -D _GREEN -D _RGSPRITES -D _REDGREENJP -D _JPTXT -D _JPLOGO -D _RGTITLE -D _METRIC -D _FPLAYER -D _MOVENPCS -D _RUNSHOES -D _EXPBAR -h -o $@ $*.asm
	
%_red_origback.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
$(pokered_origback_obj): %_red_origback.o: %.asm $$(dep)
	$(RGBASM) -D _RED -D _FPLAYER -D _MOVENPCS -D _RUNSHOES -D _EXPBAR -h -o $@ $*.asm

%_blue_origback.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
$(pokeblue_origback_obj): %_blue_origback.o: %.asm $$(dep)
	$(RGBASM) -D _BLUE -D _FPLAYER -D _MOVENPCS -D _RUNSHOES -D _EXPBAR -h -o $@ $*.asm

%_bluejp.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
$(pokebluejp_obj): %_bluejp.o: %.asm $$(dep)
	$(RGBASM) -D _BLUE -D _BLUEJP -D _JPTXT -D _JPLOGO -D _METRIC -D _SWBACKS -D _FPLAYER -D _MOVENPCS -D _RUNSHOES -D _EXPBAR -h -o $@ $*.asm

%_redjp.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
$(pokeredjp_obj): %_redjp.o: %.asm $$(dep)
	$(RGBASM) -D _RED -D _RGSPRITES -D _REDGREENJP -D _REDJP -D _JPTXT -D _JPLOGO -D _RGTITLE -D _METRIC -D _FPLAYER -D _MOVENPCS -D _RUNSHOES -D _EXPBAR -h -o $@ $*.asm

%_bluejp_origback.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
$(pokebluejp_origback_obj): %_bluejp_origback.o: %.asm $$(dep)
	$(RGBASM) -D _BLUE -D _BLUEJP -D _JPTXT -D _JPLOGO -D _METRIC -D _FPLAYER -D _MOVENPCS -D _RUNSHOES -D _EXPBAR -h -o $@ $*.asm

#gbcnote - use cjsv to compile as GBC+DMG rom
pokered_opt  = -cjsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED"
pokeblue_opt = -cjsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON BLUE"
pokegreen_opt = -cjsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON GREEN"
pokebluejp_opt = -cjsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON BLUE"
pokeredjp_opt = -cjsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED"

%.gbc: $$(%_obj)
	$(RGBLINK) -d -m $*.map -n $*.sym -l layout.link -o $@ $^
	$(RGBFIX) $($*_opt) $@


gfx/blue/intro_purin_1.2bpp: $(RGBGFX) += -h
gfx/blue/intro_purin_2.2bpp: $(RGBGFX) += -h
gfx/blue/intro_purin_3.2bpp: $(RGBGFX) += -h
gfx/red/intro_nido_1.2bpp: $(RGBGFX) += -h
gfx/red/intro_nido_2.2bpp: $(RGBGFX) += -h
gfx/red/intro_nido_3.2bpp: $(RGBGFX) += -h

gfx/game_boy.2bpp: tools/gfx += --remove-duplicates
gfx/theend.2bpp: tools/gfx += --interleave --png=$<
gfx/tilesets/%.2bpp: tools/gfx += --trim-whitespace

%.png: ;

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)
%.1bpp: %.png
	$(RGBGFX) -d1 $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)
%.pic:  %.2bpp
	tools/pkmncompress $< $@
