SRC=$(shell find lib | grep -P '\.rb$$')
EXT=$(shell find ext | grep -P '\.(c|h|re|rb)$$')

GEM_VERSION=0.1.0

GEM=cast19-$(GEM_VERSION).gem

.PHONY: clean irb gem

irb: all
	irb -Iext -Ilib -rcast19

all: ext/cast19/cast_ext.bundle

ext/cast19/cast_ext.bundle: ext/cast19/Makefile $(EXT)
	make -C ext/cast19

ext/cast19/Makefile: ext/cast19/extconf.rb
	cd ext/cast19/ && ruby extconf.rb

gem: cast19.gemspec $(SRC) $(EXT)
	gem build cast19.gemspec

clean:	
	rm -f ext/cast19/cast_ext.bundle
	rm -f ext/cast19/Makefile
	rm -f ext/cast19/*.o