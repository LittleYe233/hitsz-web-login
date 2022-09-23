all: binary minified

binary: main.js
	mkdir -p dist/bin
	pkg -t node10-linux-x64 --compress GZip main.js -o dist/bin/hitszweblogin-linux-x64
	pkg -t node10-linux-arm64 --compress GZip main.js -o dist/bin/hitszweblogin-linux-arm64

minified:
	mkdir -p dist/src
	for i in $$(ls *.js); do uglifyjs "$$i" --no-annotations -o "dist/src/$$i"; done

clean:
	rm -rf dist
