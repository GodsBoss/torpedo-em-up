build: build-dir build/index.html build/game.js

build-dir:
	[ -d build ] || mkdir build

build/index.html: src/index.html
	cp src/index.html build/index.html

build/game.js: src/code/*.coffee
	coffee -j build/game.coffee -c `ls src/code/*.coffee|grep -v init.coffee` src/code/init.coffee

clean:
	rm -rf build
