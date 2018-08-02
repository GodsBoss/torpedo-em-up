build: build-dir build/index.html build/game.js build/gfx.png

build-dir:
	[ -d build ] || mkdir build

build/index.html: src/index.html
	cp src/index.html $@

build/game.js: src/code/*
	cat `cat src/code/list` | coffee --compile --stdio > $@

build/gfx.png: src/gfx/gfx.xcf
	gimp -i -b "`cat ./src/gfx/export.scm`"

clean:
	rm -rf build
