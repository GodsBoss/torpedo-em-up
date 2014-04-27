build: build-dir build/index.html build/game.js build/gfx.png

build-dir:
	[ -d build ] || mkdir build

build/index.html: src/index.html
	cp src/index.html build/index.html

build/game.js: src/code/*
	coffee -j build/game.coffee -c `cat src/code/list`

build/gfx.png: src/gfx/gfx.xcf
	gimp -i -b "`cat ./src/gfx/export.scm`"

clean:
	rm -rf build
