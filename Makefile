ALL_PALETTES=$(wildcard palettes/*.txt)
ALL_BG=$(patsubst palettes/%.txt,syntax/%bg.vim,$(ALL_PALETTES))
ALL_FG=$(patsubst palettes/%.txt,syntax/%fg.vim,$(ALL_PALETTES))

SCRIPT=./palette2syntax.sh

all: $(ALL_BG) $(ALL_FG)

# Make palettes
syntax/%bg.vim: palettes/%.txt $(SCRIPT)
	$(SCRIPT) --background "$<" > "$@"

syntax/%fg.vim: palettes/%.txt $(SCRIPT)
	$(SCRIPT) --foreground "$<" > "$@"
