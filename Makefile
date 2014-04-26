build: build-dir

build-dir:
	[ -d build ] || mkdir build

clean:
	rm -rf build
