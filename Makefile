GEM_VERSION=0.1.1
GEM=cast19-$(GEM_VERSION).gem

SRC=$(shell find lib | grep -P '\.rb$$')
EXT=$(shell find ext | grep -P '\.(c|h|re|rb)$$')
UNAME=$(shell uname)

ifneq ($(UNAME),"Darwin\n")
LIBRARY=cast_ext.bundle
else
LIBRARY=cast_ext.so
endif

.PHONY: clean irb gem push-gem

all: ext/cast19/$(LIBRARY)

irb: all
	irb -Iext -Ilib -rcast19

ext/cast19/cast_ext.%: ext/cast19/Makefile $(EXT)
	make -C ext/cast19

ext/cast19/Makefile: ext/cast19/extconf.rb
	cd ext/cast19/ && ruby extconf.rb

gem: Makefile cast19.gemspec $(SRC) $(EXT)
	gem build cast19.gemspec

push-gem: gem
	gem push $(GEM)

clean:	
	rm -f ext/cast19/$(LIBRARY)
	rm -f ext/cast19/Makefile
	rm -f ext/cast19/*.o
	rm -f *.gem